using Dapper;
using GeneteaApi.Context;
using GeneteaApi.Models;

namespace GeneteaApi.Contracts
{
    public class TeaRepository : ITeaRepository
    {
        private readonly DapperContext _context;

        public TeaRepository(DapperContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Tea>> GetTeas()
        {
            var query = "SELECT * FROM Teas";
            using (var connection = _context.CreateConnection())
            {
                var teas = await connection.QueryAsync<Tea>(query);
                return teas.ToList();
            }
        }

        public async Task<Tea> GetTea(int id)
        {
            var query = "SELECT * FROM Teas where IdTea=@Id";
            using (var connection = _context.CreateConnection())
            {
                var tea = await connection.QuerySingleOrDefaultAsync<Tea>(query, new { id });
                return tea;
            }
        }

        public async Task<Tea> DeleteTea(int id)
        {
            var query = "DELETE FROM Teas where IdTea=@Id";
            using (var connection = _context.CreateConnection())
            {
                var tea = await connection.QuerySingleOrDefaultAsync<Tea>(query, new { id });
                return tea;
            }
        }

        public async Task<Tea> UpdateTea(Tea unTea)
        {


            var query = "UPDATE Teas " +
                "Set Label = @label ," +
                "Description = @description ," +
                "Price = @price " +
                "WHERE IdTea = @id";

            using (var connection = _context.CreateConnection())
            {
                var tea = await connection.QuerySingleOrDefaultAsync<Tea>(query, new { id = unTea.IdTea, label = unTea.Label, description = unTea.Description, price = unTea.Price });
                return tea;
            }
        }

        public async Task<Tea> InsertTea(Tea unTea)
        {
            var query = "INSERT INTO Teas "+
           "(Label, Description, Price) "+
            "VALUES (@label, @description, @price) " +
            "SELECT CAST(SCOPE_IDENTITY() as int)";

            using (var connection = _context.CreateConnection())
            {
                var id = await connection.QuerySingleAsync<int>(query, new { label = unTea.Label, description = unTea.Description, price = unTea.Price });
                
                Tea createTea = new Tea(id, unTea.Price, unTea.Label, unTea.Description);
                return createTea;
            }
        }
    }
}
