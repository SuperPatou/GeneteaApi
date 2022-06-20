﻿using Dapper;
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
                Tea tea = await connection.QuerySingleOrDefaultAsync<Tea>(query, new { name = unTea.Name_tea, description = unTea.Description_tea, price = unTea.Price_tea, image_path = unTea.Image_path_tea, link_page = unTea.Link_page_tea });
                return tea;
            }
        }

        public async Task<Tea> UpdateTea(Tea unTea)
        {
            var query = "EXEC UpdateTea @id, @name, @description, @price, @image_path, @link_page";

            using (var connection = _context.CreateConnection())
            {
                Tea tea = await connection.QuerySingleOrDefaultAsync<Tea>(query, new { id = unTea.ID_tea, name = unTea.Name_tea, description = unTea.Description_tea, price = unTea.Price_tea, image_path = unTea.Image_path_tea, link_page = unTea.Link_page_tea });
                return tea;
            }
        }

        public async Task<int> DeleteTea(int id)
        {
            var query = "EXEC DeleteTea @id";
            using (var connection = _context.CreateConnection())
            {
                var id_tea = await connection.QuerySingleOrDefaultAsync<int>(query, new { id });
                return id_tea;
            }
        }
    }
}
