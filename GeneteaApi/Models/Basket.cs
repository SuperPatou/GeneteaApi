namespace GeneteaApi.Models
{
    public class Basket
    {
        public Basket()
        {
        }

        public Basket(int id, string order_date, string validate)
        {
            ID_basket = id;
            order_date_basket = order_date;
            validate_basket = validate;
        }

        public int ID_basket { get; set; }
        public string order_date_basket { get; set; }
        public string validate_basket { get; set; }

    }
}
