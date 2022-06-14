using GeneteaApi.Models;

namespace GeneteaApi.Contracts
{
    public interface IBasketRepository
    {
        public Task<IEnumerable<Basket>> GetBaskets();
        public Task<Basket> GetBasket(int id);
        public Task<Basket> InsertBasket(Basket basket);
        public Task<Basket> UpdateBasket(int id, Basket basket);
        public Task<int> DeleteBasket(int id);
    }
}
