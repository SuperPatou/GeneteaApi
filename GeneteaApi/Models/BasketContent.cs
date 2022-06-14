namespace GeneteaApi.Models
{
    public class BasketContent
    {
        public BasketContent(int id_basket, int id_tea, int number_tea)
        {
            ID_basket = id_basket;
            ID_tea = id_tea;
            number = number_tea;
        }

        public int ID_basket { get; set; }
        public int ID_tea { get; set; }
        public int number { get; set; }

    }
}
