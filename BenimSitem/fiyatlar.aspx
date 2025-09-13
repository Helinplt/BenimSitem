<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fiyatlar.aspx.cs" Inherits="BenimSitem.fiyatlar" %>
<%@ Register Src="~/ContactWidget.ascx" TagName="ContactWidget" TagPrefix="uc" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<title>Hazır Web Sitesi Fiyatları</title>

<style>
:root {
  --mor: #7c4dff;
  --pembe: #ff6ec7;
  --mavi: #5ec5ff;
  --lacivert: #0c1b4d;
  --gece: #0b1020;
  --card: rgba(255,255,255,0.08);
  --border: rgba(255,255,255,0.18);
  --shadow: 0 10px 30px rgba(12, 27, 77, 0.25);
  --radius: 18px;
  --grad-cta: linear-gradient(135deg, var(--pembe), var(--mor));
}

/* Genel */
body {
  margin: 0;
  font-family: 'Poppins', system-ui, sans-serif;
  color: #e8ecf7;
  background: var(--gece);
  overflow-x: hidden;
}

/* Başlık */
.section-head {
  text-align: center;
  margin: 40px 0 30px;
}
.section-head h1 {
  font-size: 28px;
  margin-bottom: 6px;
}
.section-head p {
  font-size: 14px;
  color: #cfd7ff;
}

/* İçerik */
.pricing-container {
  max-width: 1100px;
  margin: 0 auto 60px;
  display: grid;
  grid-template-columns: 1fr 0.7fr;
  gap: 28px;
  padding: 20px;
  background: var(--gece); /* arka plan fix */
  border-radius: var(--radius);
}

/* Sol özellik listesi */
.features-list {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  padding: 20px;
  box-shadow: var(--shadow);
}
.feature-item {
  display: flex;
  gap: 12px;
  padding: 12px 0;
  border-bottom: 1px solid rgba(255,255,255,.08);
}
.feature-item:last-child { border-bottom: none; }
.feature-item i {
  font-size: 20px;
  color: var(--pembe);
  margin-top: 2px;
}
.feature-item h3 {
  margin: 0;
  font-size: 15px;
  color: #fff;
}
.feature-item p {
  margin: 2px 0 0;
  font-size: 13px;
  color: #cfd7ff;
}

/* Sağ fiyat kutusu */
.price-box {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  padding: 24px;
  box-shadow: var(--shadow);
  text-align: center;
}
.price-box .price {
  font-size: 34px;
  font-weight: 700;
  background: var(--grad-cta);
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
}
.price-box .price span {
  font-size: 15px;
  color: #ddd;
}
.price-sub {
  font-size: 14px;
  margin: 6px 0 16px;
  color: #cfd7ff;
}
.price-list {
  list-style: none;
  padding: 0;
  margin: 0 0 20px;
  text-align: left;
}
.price-list li {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 14px;
  color: #e0e6ff;
  margin: 6px 0;
}
.price-list li i { color: var(--pembe); }
.cta-btn {
  display: block;
  padding: 12px 18px;
  border-radius: 10px;
  background: var(--grad-cta);
  color: #fff;
  font-weight: 600;
  text-decoration: none;
  margin: 14px 0;
}
.refund {
  font-size: 13px;
  color: var(--pembe);
}



/* Domain Section */
.domain-section {
  max-width: 1070px;
  margin: 0 auto 60px;
  padding: 30px 20px;
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  box-shadow: var(--shadow);
}

.domain-box h2 {
  font-size: 22px;
  margin-bottom: 10px;
  color: #fff;
}

.domain-box p {
  font-size: 14px;
  color: #cfd7ff;
  line-height: 1.6;
}

.domain-box a {
  color: var(--mavi);
  font-weight: 600;
  text-decoration: none;
}

.domain-box a:hover {
  text-decoration: underline;
}



/* Promo Section */
.promo-section {
  max-width: 1070px;
  margin: 60px auto;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 30px;
  align-items: center;
  padding: 20px;
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  box-shadow: var(--shadow);
}

.promo-content h2 {
  font-size: 22px;
  margin-bottom: 14px;
  color: #fff;
}

.promo-content p {
  font-size: 14px;
  color: #cfd7ff;
  line-height: 1.6;
  margin-bottom: 20px;
}

.promo-content .cta-btn {
  display: inline-block;
  padding: 12px 20px;
  border-radius: 10px;
  background: var(--grad-cta);
  color: #fff;
  font-weight: 600;
  text-decoration: none;
}

/* Slider */
.promo-slider {
  position: relative;
  width: 100%;
  height: 280px;
  overflow: hidden;
  border-radius: var(--radius);
}

.promo-slider img {
  position: absolute;
  top: 0; left: 0;
  width: 100%; height: 100%;
  object-fit: cover;
  border-radius: var(--radius);
  opacity: 0;
  transition: opacity 1s ease;
}

.promo-slider img.active {
  opacity: 1;
}

/* Banner Section */
.banner-strip {
  width: 100%;
  padding: 50px 20px;
  background: linear-gradient(90deg, var(--mavi), var(--mor));
  text-align: center;
  margin-top:10px;
  margin-bottom:10px;
}

.banner-strip h2 {
  margin: 0;
  font-size: 26px;
  font-weight: 700;
  color: #fff;
  letter-spacing: 0.5px;
}

/* ===== SADECE MOBİL TASARIM (≤ 768px) ===== */

/* Global dokunma/okunabilirlik */
@media (max-width: 768px){
  :root{
    --radius: 16px;
    --shadow: 0 10px 28px rgba(12,27,77,.22);
  }

  body{ font-size: 15px; }

  /* Başlıklar */
  .section-head{ margin: 26px 0 18px; padding: 0 14px; }
  .section-head h1{ font-size: clamp(20px, 6vw, 24px); margin-bottom: 6px; }
  .section-head p{ font-size: clamp(13px, 3.6vw, 14px); }

  /* Ana grid → tek sütun */
  .pricing-container{
    grid-template-columns: 1fr;
    max-width: 680px;
    padding: 14px;
    gap: 18px;
  }
  .price-box{ order: -1; padding: 18px; }
  .price-box .price{ font-size: 30px; }
  .price-box .price span{ font-size: 14px; }
  .price-sub{ font-size: 13px; }
  .price-list li{ font-size: 13px; gap: 6px; }

  .features-list{ padding: 16px; }
  .feature-item{ gap: 10px; padding: 10px 0; }
  .feature-item i{ font-size: 18px; }
  .feature-item h3{ font-size: 14px; }
  .feature-item p{ font-size: 12.8px; }

  .domain-section{ padding: 18px 14px; border-radius: 14px; }
  .domain-box h2{ font-size: 20px; }
  .domain-box p{ font-size: 13.5px; }

  .promo-section{
    grid-template-columns: 1fr;
    gap: 16px;
    padding: 14px;
    border-radius: 14px;
  }
  .promo-content h2{ font-size: 20px; }
  .promo-content p{ font-size: 13.5px; }

  .cta-btn{
    display: block;
    padding: 13px 16px;
    font-size: 14px;
    border-radius: 12px;
    text-align: center;
    min-height: 44px;
  }

  /* Slider yüksekliği ekranla orantılı */
  .promo-slider{
    height: min(52vh, 280px);
    border-radius: 14px;
  }
  .promo-slider img{ border-radius: 14px; }

  /* ===== Banner – Mobil Premium ===== */
   .banner-strip{
    padding: 36px 14px;
    margin: 12px;
    border-radius: 14px;
    text-align: center;
    margin-left:-15px !important;
  }
  .banner-strip h2{
    font-size: clamp(18px, 6vw, 22px);
    line-height: 1.3;
    max-width: 100%;
    margin: 0 auto;
    word-break: break-word;
    white-space: normal;
  }

  @keyframes sweep{
    0%{ transform: translateX(0); opacity:.0; }
    10%{ opacity:.9; }
    100%{ transform: translateX(260%); opacity:.0; }
  }

  .banner-strip h2{
    margin: 0;
    font-weight: 800;
    letter-spacing: .3px;
    text-wrap: balance;
    /* Fluid tipografi */
    font-size: clamp(20px, 6vw, 24px);
    line-height: 1.25;
    color: #fff;
    text-shadow: 0 2px 20px rgba(12,27,77,.22);
  }

  /* Banner alt açıklama ve küçük CTA (opsiyonel) */
  .banner-strip p{
    margin: 10px auto 0;
    max-width: 40ch;
    font-size: clamp(13px, 3.8vw, 14px);
    color: #f3f6ff;
    opacity: .92;
  }

  .banner-strip .cta-btn{
    display: inline-block;
    margin-top: 14px;
    padding: 12px 16px;
    border-radius: 12px;
    background: var(--grad-cta);
    color: #fff;
    font-weight: 700;
    text-decoration: none;
    min-height: 44px;
  }
}

/* Küçük telefonlar */
@media (max-width: 560px){
  .pricing-container{ padding: 12px; }
  .promo-slider{ height: min(50vh, 260px); }
  .banner-strip{ margin: 10px 10px 14px; border-radius: 14px; }
  .banner-strip h2{ font-size: clamp(19px, 7vw, 22px); }
}

/* Çok küçük cihazlar (≤390px) */
@media (max-width: 390px){
  .price-box{ padding: 14px; }
  .price-box .price{ font-size: 26px; }
  .price-list li{ font-size: 12.5px; }
  .promo-content h2{ font-size: 18px; }
  .promo-content p{ font-size: 13px; }
  .promo-slider{ height: 46vh; }
}

/* Yüksekliği kısa ekranlar için */
@media (max-height: 620px){
  .promo-slider{ height: 38vh; }
}

/* Hareketi azalt: banner süpürmeyi kapat */
@media (prefers-reduced-motion: reduce){
  .banner-strip::after{ animation: none !important; }
  *{ transition-duration: .01ms !important; animation-duration: .01ms !important; }
}


</style>
</head>
<body>
<uc:Header ID="Header1" runat="server" />
<form id="form1" runat="server">

  <!-- Başlık -->
  <div class="section-head">
    <h1>Hazır Web Sitesi Fiyatları</h1>
   <p>
  <a href="anasayfa.aspx" style="color:#9fb3ff; text-decoration:none;">Ana Sayfa</a> / 
  <span>Fiyatlar</span>
</p>

  </div>

    <!-- Banner Section -->
<section class="banner-strip">
  <h2>En Uygun Fiyatlarla Web Sitesi Satın Alın</h2>
</section>


  <!-- İçerik -->
  <div class="pricing-container">
    <!-- Sol özellikler -->
    <div class="features-list">
      <div class="feature-item"><i class="fa-solid fa-sparkles"></i><div><h3>Yönetim Paneli</h3><p>Türkçe panel ile web sitenizi dilediğiniz gibi güncelleyin.</p></div></div>
      <div class="feature-item"><i class="fa-solid fa-layer-group"></i><div><h3>Sınırsız Sayfalar</h3><p>Limitsiz sayfalar, galeriler, haberler ve referanslar oluşturun.</p></div></div>
      <div class="feature-item"><i class="fa-solid fa-box"></i><div><h3>Ürün Yönetimi</h3><p>Ürünlerinizi sergileyin, satış yapın, sipariş veya teklifler alın.</p></div></div>
      <div class="feature-item"><i class="fa-solid fa-flag"></i><div><h3>Yabancı Dil Desteği</h3><p>Her dil için profesyonel hazır web sitesi sunumları yapın.</p></div></div>
      <div class="feature-item"><i class="fa-solid fa-mobile-screen"></i><div><h3>Mobil Uyumlu</h3><p>Tüm cihazlarda kusursuz görünüm.</p></div></div>
      <div class="feature-item"><i class="fa-solid fa-magnifying-glass-chart"></i><div><h3>SEO Optimizasyonu</h3><p>Google kriterlerine uygun güncel web sitesine sahip olun.</p></div></div>
      <div class="feature-item"><i class="fa-solid fa-user-tie"></i><div><h3>Uzman Ekip</h3><p>Tasarım ve yazılım uzmanlarımız her zaman yanınızda.</p></div></div>
    </div>

    <!-- Sağ fiyat kutusu -->
    <div class="price-box">
      <div class="price">2.790 <span>TL + KDV</span></div>
      <p class="price-sub">’den başlayan fiyatlarla</p>
      <ul class="price-list">
        <li><i class="fa-solid fa-check"></i> Kurumsal Hosting</li>
        <li><i class="fa-solid fa-check"></i> Kurumsal E-Posta</li>
        <li><i class="fa-solid fa-check"></i> 20GB Band (Aylık)</li>
        <li><i class="fa-solid fa-check"></i> 10GB Disk Alanı</li>
        <li><i class="fa-solid fa-check"></i> Teknik Destek</li>
        <li><i class="fa-solid fa-check"></i> Ücretsiz SSL</li>
      </ul>
      <a href="#satinal" class="cta-btn">Web Site Satın Al</a>
      <p class="refund">7 gün iade kampanyası</p>
    </div>
  </div>


    <!-- Domain Fiyatları Section -->
<section class="domain-section">
  <div class="domain-box">
    <h2>Domain Fiyatları</h2>
    <p>
      En iyi fiyatlarla web siteniz için domainler. 
      <a href="domainfiyatlari.aspx">Domain fiyatları</a> sayfamızı ziyaret edin.
    </p>
  </div>
</section>

    <!-- Bulutweb Tanıtım Section -->
<section class="promo-section">
  <div class="promo-content">
    <h2>Helin Stdio: 1000’den Fazla Firmanın Tercihi</h2>
    <p>
      Helin Stdio 1000’den fazla firma kullanıyor. Kullanıcı dostu arayüzümüz, 
      özelleştirilebilir çözümlerimiz ve güvenilir altyapımız ile işletmelerin 
      dijital varlıklarını en üst düzeye çıkarmalarına yardımcı oluyoruz.
    </p>
    <a href="#hemen" class="cta-btn">Sizin de Bir Web Sitniz Olsun</a>
  </div>

  <div class="promo-slider">
    <img src="resim/1.adım.png" alt="Tanıtım 1" class="active">
    <img src="resim/2.adım.png" alt="Tanıtım 2">
    <img src="resim/3.adım.png" alt="Tanıtım 3">
  </div>
</section>

</form>
<uc:ContactWidget ID="ContactWidget1" runat="server" />
<uc:Footer ID="Footer1" runat="server" />


    <script>
  let slides = document.querySelectorAll(".promo-slider img");
  let index = 0;

  setInterval(() => {
    slides[index].classList.remove("active");
    index = (index + 1) % slides.length;
    slides[index].classList.add("active");
  }, 3000); // 3 saniye
    </script>

</body>
</html>
