using Dapper;
using GeneteaApi.Context;
using GeneteaApi.Models;

namespace GeneteaApi.Contracts
{
    public class BasketRepository : IBasketRepository
    {
        private readonly DapperContext _context;

        public BasketRepository(DapperContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Basket>> GetBaskets()
        {
            string query = "EXEC GetBaskets";
            using (var connection = _context.CreateConnection())
            {
                var baskets = await connection.QueryAsync<Basket>(query);
                return baskets.ToList();
            }
        }

        public async Task<Basket> GetBasket(int id)
        {
            string query = "EXEC GetBasket @id";
            using (var connection = _context.CreateConnection())
            {
                Basket basket = await connection.QuerySingleOrDefaultAsync<Basket>(query, new { id });
                return basket;
            }
        }

        public async Task<Basket> InsertBasket(Basket unBasket)
        {
            string query = "EXEC InsertBasket @name, @description, @price, @image_path, @link_page"; //To change !!

            using (var connection = _context.CreateConnection())
            {
                Basket basket = await connection.QuerySingleOrDefaultAsync<Basket>(query, new { name = unTea.name_tea, description = unTea.description_tea, price = unTea.price_tea, image_path = unTea.image_path_tea, link_page = unTea.link_page_tea });
                return basket;
            }
        }

        public async Task<Basket> UpdateBasket(Basket unBasket)
        {
            string query = "EXEC UpdateBasket @id, @name, @description, @price, @image_path, @link_page"; //To change !!

            using (var connection = _context.CreateConnection())
            {
                Basket basket = await connection.QuerySingleOrDefaultAsync<Basket>(query, new { id = unTea.ID_tea, name = unTea.name_tea, description = unTea.description_tea, price = unTea.price_tea, image_path = unTea.image_path_tea, link_page = unTea.link_page_tea });
                return basket;
            }
        }

        public async Task<int> DeleteBasket(int id)
        {
            string query = "EXEC DeleteBasket @id";
            using (var connection = _context.CreateConnection())
            {
                int id_basket = await connection.QuerySingleOrDefaultAsync<int>(query, new { id });
                return id_basket;
            }
        }
    }
}
