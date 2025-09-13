using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BenimSitem
{
    public partial class ContactWidget : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Tek yerden yönetim için özelleştirilebilir alanlar
        public string PhoneNumber { get; set; } = "+905551112233";       // tel: için
        public string WhatsappNumber { get; set; } = "905551112233";     // wa.me için (başında + yok)
        public string WhatsappMessage { get; set; } = "Merhaba%20Helin%20Studio"; // URL-encoded
        public string CallbackUrl { get; set; } = "/iletisim.aspx#callback";      // form ya da modal linki

        protected void Page_PreRender(object sender, EventArgs e)
        {
            // Telefon
            lnkPhone.Attributes["href"] = "tel:" + PhoneNumber;

            // WhatsApp resmi bağlantı formatı
            string wa = $"https://wa.me/{WhatsappNumber}?text={WhatsappMessage}";
            lnkWhatsapp.Attributes["href"] = wa;

            // Sizi Arayalım
            lnkCallback.Attributes["href"] = CallbackUrl;
        }
    }
}