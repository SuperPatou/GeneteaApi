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
            var query = "EXEC GetTeas";
            using (var connection = _context.CreateConnection())
            {
                var teas = await connection.QueryAsync<Tea>(query);
                return teas.ToList();
            }
        }

        public async Task<Tea> GetTea(int id)
        {
            var query = "EXEC GetTea @id";
            using (var connection = _context.CreateConnection())
            {
                var tea = await connection.QuerySingleOrDefaultAsync<Tea>(query, new { id });
                return tea;
            }
        }

        public async Task<Tea> InsertTea(Tea unTea)
        {
            var query = "EXEC InsertTea @name, @description, @price, @image_path, @link_page";

            using (var connection = _context.CreateConnection())
            {
                var id = await connection.QuerySingleOrDefaultAsync<int>(query, new { name = unTea.name_tea, description = unTea.description_tea, price = unTea.price_tea, image_path = unTea.image_path_tea, link_page = unTea.link_page_tea }); ;

                Tea createTea = new Tea(id, unTea.name_tea, unTea.description_tea, unTea.price_tea, unTea.image_path_tea, unTea.link_page_tea);
                return createTea;
            }
        }

        public async Task<Tea> UpdateTea(Tea unTea)
        {
            var query = "EXEC UpdateTea @id, @name, @description, @price, @image_path, @link_page";

            using (var connection = _context.CreateConnection())
            {
                var tea = await connection.QuerySingleOrDefaultAsync<Tea>(query, new { id = unTea.ID_tea, name = unTea.name_tea, description = unTea.description_tea, price = unTea.price_tea, image_path = unTea.image_path_tea, link_page = unTea.link_page_tea }); ;
                return tea;
            }
        }

        public async Task<Tea> DeleteTea(int id)
        {
            var query = "EXEC DeleteTea @id";
            using (var connection = _context.CreateConnection())
            {
                var tea = await connection.QuerySingleOrDefaultAsync<Tea>(query, new { id });
                return tea;
            }
        }
    }
}
