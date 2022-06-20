namespace GeneteaApi.Models
{
    public class Basket
    {
        public int ID_basket { get; set; }
        public DateTime Order_date_basket { get; set; }
        public bool Validate_basket { get; set; }
        public Basket() { }
        public Basket(DateTime order_date, bool validate, int id = 1)
        {
            ID_basket = id;
            Order_date_basket = order_date;
            Validate_basket = validate;
        }

        

    }
}
