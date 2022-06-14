using Dapper;
using GeneteaApi.Context;
using GeneteaApi.Models;

namespace GeneteaApi.Contracts
{
    public class BasketContentRepository : IBasketContentRepository
    {
        private readonly DapperContext _context;

        public BasketContentRepository(DapperContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<BasketContent>> GetBasketContent()
        {
            string query = "EXEC GetBasketContent";
            using (var connection = _context.CreateConnection())
            {
                var basketContent = await connection.QueryAsync<BasketContent>(query);
                return basketContent.ToList();
            }
        }
    }
}
