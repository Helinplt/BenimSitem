<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="domainfiyatlari.aspx.cs" Inherits="BenimSitem.domainfiyatlari" %>
<%@ Register Src="~/ContactWidget.ascx" TagName="ContactWidget" TagPrefix="uc" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>
<title>Domain Fiyatları</title>

<style>
/* ====== Tema Değişkenleri ====== */
:root{
  --mor:#7c4dff; --pembe:#ff6ec7; --mavi:#5ec5ff; --lacivert:#0c1b4d; --gece:#0b1020;
  --beyaz:#fff; --card:rgba(255,255,255,.08); --border:rgba(255,255,255,.18);
  --shadow:0 10px 30px rgba(12,27,77,.25); --radius:18px; --radius-lg:26px;
  --grad-cta:linear-gradient(135deg, var(--pembe), var(--mor));
}

/* ====== Reset / Base ====== */
*{ box-sizing:border-box; }
html,body{ height:100%; }
body{
  margin:0; font-family:'Poppins',system-ui,-apple-system,Segoe UI,Roboto,sans-serif;
  color:#e8ecf7; background:var(--gece); overflow-x:hidden;
}
a{ color:inherit; }

/* ====== Sayfa Kapsayıcı ====== */
.domain-wrap{ max-width:1100px; margin:28px auto 80px; padding:0 18px; }

/* Başlık Kartı */
.page-title{
  position:relative; padding:22px 24px; border-radius:var(--radius);
  background:var(--card); border:1px solid var(--border); box-shadow:var(--shadow);
}
.page-title h1{
  margin:0; font-size:28px; font-weight:700; color:#eaf0ff; letter-spacing:.2px;
}
.page-title .subtitle{
  margin:6px 0 0; font-size:14px; color:#cfd7ff;
}
.badges{
  display:flex; gap:8px; margin-top:14px; flex-wrap:wrap;
}
.badge{
  font-size:12px; padding:6px 10px; border-radius:999px; color:#0d163a;
  background:linear-gradient(120deg,#c7e9ff,#ffd5f1);
  border:1px solid rgba(255,255,255,.45);
}

/* Kart (Tablo Alanı) */
.price-card{
  margin-top:24px; background:var(--card); border:1px solid var(--border);
  border-radius:var(--radius); box-shadow:var(--shadow);
}

/* Kaydırılabilir kılıf (desktop/tablet) */
.table-scroll{ width:100%; overflow-x:auto; -webkit-overflow-scrolling:touch;
  border-top-left-radius:var(--radius); border-top-right-radius:var(--radius);
}

/* Sütun hesaplamasını sabitle */
.domain-table{
  table-layout: fixed;
  width: 100%;
  border-collapse: collapse;
  min-width: 720px;
  font-variant-numeric: tabular-nums;
}

/* Tüm hücrelerde aynı kutu modeli + padding */
.domain-table thead th,
.domain-table tbody td{
  box-sizing: border-box;
  padding: 16px 18px;
  font-size: 14px;
}

/* Kolon genişlikleri */
.domain-table thead th:nth-child(1),
.domain-table tbody td:nth-child(1){ width: 22%; }
.domain-table thead th:nth-child(2),
.domain-table tbody td:nth-child(2){ width: 26%; }
.domain-table thead th:nth-child(3),
.domain-table tbody td:nth-child(3){ width: 26%; }
.domain-table thead th:nth-child(4),
.domain-table tbody td:nth-child(4){ width: 26%; }

/* Hizalama: ilk sütun SOL, fiyat sütunları ORTA */
.domain-table thead th{ text-align: center; }
.domain-table tbody td{ text-align: center; }
.domain-table thead th:first-child,
.domain-table tbody td:first-child{ text-align: left; }

.domain-table tbody tr:nth-child(even){ background:rgba(255,255,255,.05); }
.domain-table tbody tr:hover{ background:rgba(124,77,255,.09); }
.domain-table tbody tr:hover td:first-child .tld-link{ color:#fff; text-shadow:0 0 10px rgba(124,77,255,.8); }

/* Uzantı bağlantısı */
.tld-link{
  display:inline-flex; align-items:center; gap:8px; font-weight:700; text-decoration:none;
  color:var(--mavi);
}
.tld-link::before{
  content:""; width:8px; height:8px; border-radius:50%;
  background:radial-gradient(circle at 30% 30%, #fff, var(--mavi));
  box-shadow:0 0 10px var(--mavi);
}

/* Notlar */
.domain-notes{ text-align:center; padding:20px 16px 26px; color:#cfd7ff; }
.domain-notes p{ margin:8px 0; font-size:14px; }
.domain-notes a{ color:var(--mavi); font-weight:600; text-decoration:none; }
.domain-notes a:hover{ text-decoration:underline; }


/* ====== MOBİL TASARIM – TÜM CİHAZLAR İÇİN ====== */

/* Tablet ve küçük dizüstü (≤1024px) */
@media (max-width: 1024px){
  .domain-wrap{ padding: 0 14px; }
  .page-title{ padding: 20px; }
  .page-title h1{ font-size: 24px; }
  .page-title .subtitle{ font-size: 13.5px; }
  .badge{ font-size: 11.5px; padding: 6px 9px; }

  /* Tablo yatay kaydırılabilir kalsın */
  .table-scroll{ overflow-x: auto; -webkit-overflow-scrolling: touch; }
  .domain-table{ min-width: 680px; }
  .domain-table thead th,
  .domain-table tbody td{ padding: 14px 14px; font-size: 13.5px; }
}

/* Telefon boyutu – stacked kart görünüm (≤640px) */
@media (max-width: 640px){
  .page-title{ padding: 18px; }
  .page-title h1{ font-size: 22px; }

  /* Tabloyu kart-kart yap (data-th etiketlerini kullanır) */
  .table-scroll{ overflow-x: visible; }
  .domain-table{ min-width: 0; width: 100%; table-layout: auto; }
  .domain-table thead{ display: none; }              /* header gizle */
  .domain-table tbody{ display: grid; gap: 12px; padding: 12px; }
  .domain-table tr{
    display: grid; grid-template-columns: 1fr; gap: 10px;
    background: rgba(255,255,255,.05);
    border: 1px solid rgba(255,255,255,.10);
    border-radius: 14px;
    padding: 12px 12px;
    box-shadow: 0 6px 16px rgba(12,27,77,.18);
  }
  .domain-table td{
    display: flex; align-items: center; justify-content: space-between;
    padding: 8px 6px; font-size: 13.5px; border: 0;
    text-align: right;                               /* değer sağda */
  }
  .domain-table td::before{
    content: attr(data-th);                          /* sol etiket */
    color: #aeb9e8; font-weight: 600; margin-right: 14px; text-align: left;
  }
  .domain-table td[data-th="Uzantı"]{
    padding-top: 2px; padding-bottom: 6px; text-align: left;
  }
  .domain-table td[data-th="Uzantı"]::before{ color:#9fcfff; }
  .domain-table td[data-th="Uzantı"] .tld-link{ font-size: 15px; }

  .domain-notes{ padding: 18px 12px 22px; font-size: 13.5px; }
}

/* Küçük telefonlar (≤480px) */
@media (max-width: 480px){
  .domain-wrap{ padding: 0 10px; }
  .page-title{ padding: 16px; border-radius: 14px; }
  .page-title h1{ font-size: 20px; }
  .badge{ font-size: 11px; padding: 5px 8px; }

  .domain-table tbody{ gap: 10px; padding: 10px; }
  .domain-table tr{ padding: 10px; border-radius: 12px; }
  .domain-table td{ font-size: 13px; }
}

/* Çok küçük cihazlar (≤390px) */
@media (max-width: 390px){
  .page-title h1{ font-size: 19px; }
  .domain-table td{ font-size: 12.5px; }
}

/* Güvenli alan (çentik) desteği */
@media (max-width: 768px){
  .domain-wrap{ padding-left: max(10px, env(safe-area-inset-left));
                padding-right: max(10px, env(safe-area-inset-right)); }
}

/* Hareketi azalt tercihi */
@media (prefers-reduced-motion: reduce){
  *{ transition-duration: .01ms !important; animation-duration: .01ms !important; }
}

</style>
</head>

<body>
  <uc:Header ID="Header1" runat="server" />
  <form id="form1" runat="server">

    <div class="domain-wrap">
      <!-- Başlık -->
      <div class="page-title">
        <h1>Siteniz İçin Domain Fiyatları</h1>
        <p class="subtitle">Popüler uzantıların kayıt, transfer ve yenileme ücretleri. Neon-pastel koyu temaya tam uyum.</p>
        <div class="badges">
          <span class="badge"><i class="fa-solid fa-shield-check"></i> Güvenli Kayıt</span>
          <span class="badge"><i class="fa-solid fa-rotate"></i> Kolay Transfer</span>
          <span class="badge"><i class="fa-solid fa-arrows-rotate"></i> Hızlı Yenileme</span>
        </div>
      </div>

      <!-- Tablo Kartı -->
      <div class="price-card">
        <div class="table-scroll">
          <table class="domain-table">
            <thead>
              <tr>
                <th>Uzantı</th>
                <th>Domain Kayıt Fiyatı</th>
                <th>Domain Transfer Fiyatı</th>
                <th>Domain Yenileme Fiyatı</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td data-th="Uzantı"><a class="tld-link" href="#">.com</a></td>
                <td data-th="Domain Kayıt Fiyatı">690.00 TL</td>
                <td data-th="Domain Transfer Fiyatı">690.00 TL</td>
                <td data-th="Domain Yenileme Fiyatı">690.00 TL</td>
              </tr>
              <tr>
                <td data-th="Uzantı"><a class="tld-link" href="#">.tr</a></td>
                <td data-th="Domain Kayıt Fiyatı">390.00 TL</td>
                <td data-th="Domain Transfer Fiyatı">390.00 TL</td>
                <td data-th="Domain Yenileme Fiyatı">390.00 TL</td>
              </tr>
              <tr>
                <td data-th="Uzantı"><a class="tld-link" href="#">.com.tr</a></td>
                <td data-th="Domain Kayıt Fiyatı">190.00 TL</td>
                <td data-th="Domain Transfer Fiyatı">190.00 TL</td>
                <td data-th="Domain Yenileme Fiyatı">190.00 TL</td>
              </tr>
              <tr>
                <td data-th="Uzantı"><a class="tld-link" href="#">.net</a></td>
                <td data-th="Domain Kayıt Fiyatı">890.00 TL</td>
                <td data-th="Domain Transfer Fiyatı">890.00 TL</td>
                <td data-th="Domain Yenileme Fiyatı">890.00 TL</td>
              </tr>
              <tr>
                <td data-th="Uzantı"><a class="tld-link" href="#">.org</a></td>
                <td data-th="Domain Kayıt Fiyatı">490.00 TL</td>
                <td data-th="Domain Transfer Fiyatı">490.00 TL</td>
                <td data-th="Domain Yenileme Fiyatı">490.00 TL</td>
              </tr>
              <tr>
                <td data-th="Uzantı"><a class="tld-link" href="#">.name.tr</a></td>
                <td data-th="Domain Kayıt Fiyatı">190.00 TL</td>
                <td data-th="Domain Transfer Fiyatı">190.00 TL</td>
                <td data-th="Domain Yenileme Fiyatı">190.00 TL</td>
              </tr>
              <tr>
                <td data-th="Uzantı"><a class="tld-link" href="#">.gen.tr</a></td>
                <td data-th="Domain Kayıt Fiyatı">190.00 TL</td>
                <td data-th="Domain Transfer Fiyatı">190.00 TL</td>
                <td data-th="Domain Yenileme Fiyatı">190.00 TL</td>
              </tr>
              <tr>
                <td data-th="Uzantı"><a class="tld-link" href="#">.web.tr</a></td>
                <td data-th="Domain Kayıt Fiyatı">190.00 TL</td>
                <td data-th="Domain Transfer Fiyatı">190.00 TL</td>
                <td data-th="Domain Yenileme Fiyatı">190.00 TL</td>
              </tr>
              <tr>
                <td data-th="Uzantı"><a class="tld-link" href="#">.biz.tr</a></td>
                <td data-th="Domain Kayıt Fiyatı">190.00 TL</td>
                <td data-th="Domain Transfer Fiyatı">190.00 TL</td>
                <td data-th="Domain Yenileme Fiyatı">190.00 TL</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="domain-notes">
          <p>* Fiyatlar yeni bir <a href="anasayfa.aspx">web site</a> lisansı ile beraber alındığında geçerlidir.</p>
          <p>* Fiyatlara %20 KDV dahil değildir.</p>
        </div>
      </div>
    </div>

  </form>
  <uc:ContactWidget ID="ContactWidget1" runat="server" />
  <uc:Footer ID="Footer1" runat="server" />
</body>
</html>
