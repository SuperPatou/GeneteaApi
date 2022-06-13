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
            string query = "EXEC InsertBasket @order_date_basket, @validate_basket";

            using (var connection = _context.CreateConnection())
            {
                Basket basket = await connection.QuerySingleOrDefaultAsync<Basket>(query, new { order_date_basket = unBasket.order_date_basket, validate_basket = unBasket.validate_basket });
                return basket;
            }
        }

        public async Task<Basket> UpdateBasket(Basket unBasket)
        {
            string query = "EXEC UpdateBasket @id, @order_date_basket, @validate_basket";

            using (var connection = _context.CreateConnection())
            {
                Basket basket = await connection.QuerySingleOrDefaultAsync<Basket>(query, new { id= unBasket.ID_basket, order_date_basket = unBasket.order_date_basket, validate_basket = unBasket.validate_basket });
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
