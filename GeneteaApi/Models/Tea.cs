namespace GeneteaApi.Models
{
    public class Tea
    {
        public int ID_tea { get; set; }
        public string Name_tea { get; set; } = String.Empty;
        public string Description_tea { get; set; } = String.Empty;
        public float Price_tea { get; set; }
        public string Image_path_tea { get; set; } = String.Empty;
        public string Link_page_tea { get; set; } = String.Empty;
        public Tea() { }
        public Tea(int id, string name, string description, float price, string image_path, string link_page)
        {
            ID_tea = id;
            Name_tea = name;
            Description_tea = description;
            Price_tea = price;
            Image_path_tea = image_path;
            Link_page_tea = link_page;
        }
        
        

    }
}
