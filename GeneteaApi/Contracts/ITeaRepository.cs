using GeneteaApi.Models;

namespace GeneteaApi.Contracts
{
    public interface ITeaRepository
    {
        public Task<IEnumerable<Tea>> GetTeas();

        public Task<Tea> GetTea(int id);
    }
}
