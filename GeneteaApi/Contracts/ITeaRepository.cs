using GeneteaApi.Models;

namespace GeneteaApi.Contracts
{
    public interface ITeaRepository
    {
        public Task<IEnumerable<Tea>> GetTeas();
        public Task<Tea> GetTea(int id);
        public Task<Tea> InsertTea(Tea tea);
        public Task<Tea> UpdateTea(Tea tea);
        public Task<int> DeleteTea(int id);
    }
}
