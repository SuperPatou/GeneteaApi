namespace GeneteaApi.Models
{
    public class Tea
    {
        public Tea(int id, string name, string description, float price, string image_path, string link_page)
        {
            ID_tea = id;
            name_tea = name;
            description_tea = description;
            price_tea = price;
            image_path_tea = image_path;
            link_page_tea = link_page;
        }

        public int ID_tea { get; set; }
        public string name_tea { get; set; }
        public string description_tea { get; set; }
        public float price_tea { get; set; }
        public string image_path_tea { get; set; }
        public string link_page_tea { get; set; }

    }
}
