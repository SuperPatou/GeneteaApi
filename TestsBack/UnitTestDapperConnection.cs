using GeneteaApi.Context;
using GeneteaApi.Contracts;
using System.Data;

namespace TestsBack
{
    [TestClass]
    public class UnitTestDapperConnection
    {
        [TestMethod]
        public void CheckProcedureGetTeas()
        {
            ITeaRepository _teaRepo = new TeaRepository(DapperContext e);
            Assert.IsNotNull(_teaRepo.GetTeas());
        }
    }
}