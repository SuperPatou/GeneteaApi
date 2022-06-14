using GeneteaApi.Models;

namespace GeneteaApi.Contracts
{
    public interface IBasketContentRepository
    {
        public Task<IEnumerable<BasketContent>> GetBasketContent();
    }
}
