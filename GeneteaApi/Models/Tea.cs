namespace GeneteaApi.Models
{
    public class Tea
    {
        public Tea()
        {
        }

        public Tea(int id, float price, string label, string description)
        {
            IdTea = id;
            Price = price;
            Label = label;
            Description = description;
        }

        public int IdTea { get; set; }

        public float Price { get; set; }

        public string Label { get; set; }

        public string Description { get; set; }
    }
}
