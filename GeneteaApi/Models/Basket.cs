namespace GeneteaApi.Models
{
    public class Basket
    {
        public Basket(DateTime order_date, bool validate, int id = 1)
        {
            ID_basket = id;
            order_date_basket = order_date;
            validate_basket = validate;
        }

        public int ID_basket { get; set; }
        public DateTime order_date_basket { get; set; }
        public bool validate_basket { get; set; }

    }
}
