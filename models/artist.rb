require_relative('../db/sql_runner')

class Artist

  attr_accessor :first_name, :last_name, :dob
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @dob = options['dob'].to_i
  end

def save()
   sql = "INSERT INTO artists
   (
     first_name,
     last_name,
     dob
   )
   VALUES
   (
     $1, $2, $3
   )
   RETURNING id"
   values = [@first_name, @last_name, @dob]
   results = SqlRunner.run(sql, values)
   @id = results.first()['id'].to_i
end

def update()
    sql = "UPDATE artists
    SET
    (
      first_name,
      last_name,
      dob
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @dob]
    SqlRunner.run(sql, values)
  end

  def delete()
     sql = "DELETE FROM artists
     WHERE id = $1"
     values = [@id]
     SqlRunner.run(sql, values)
   end

end
