<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ozellikler.aspx.cs" Inherits="BenimSitem.ozellikler" %>
<%@ Register Src="~/ContactWidget.ascx" TagName="ContactWidget" TagPrefix="uc" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<!DOCTYPE html>

 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style>
           :root {
       --mor: #7c4dff; /* mor */
       --pembe: #ff6ec7; /* pembe */
       --mavi: #5ec5ff; /* mavi */
       --lacivert: #0c1b4d; /* lacivert */
       --gece: #0b1020; /* koyu arka plan */
       --acik: #f7f9fc; /* açık arka plan */
       --beyaz: #ffffff;
       --card: rgba(255,255,255,0.08);
       --glass: rgba(255,255,255,0.6);
       --border: rgba(255,255,255,0.18);
       --shadow: 0 10px 30px rgba(12, 27, 77, 0.25);
       --radius: 18px;
       --radius-lg: 26px;
       --grad-hero: radial-gradient(1200px 800px at 10% -10%, rgba(124,77,255,.35), transparent 60%), radial-gradient(800px 600px at 90% 0%, rgba(255,110,199,.30), transparent 60%), radial-gradient(900px 700px at 50% 120%, rgba(94,197,255,.30), transparent 60%), linear-gradient(180deg, #0a0f2a 0%, #0c1334 60%, #101944 100%);
       --grad-cta: linear-gradient(135deg, var(--pembe), var(--mor));
       --grad-stroke: linear-gradient(135deg, rgba(255,110,199,.6), rgba(94,197,255,.6));
   }

   * {
       box-sizing: border-box;
   }

   html, body {
       height: 100%;
   }

   body {
       margin: 0;
       font-family: 'Poppins', system-ui, -apple-system, Segoe UI, Roboto, sans-serif;
       color: #e8ecf7;
       background: var(--gece);
       overflow-x: hidden;
   }

   /* --- Özellikler sayfası (Features) --- */
.features{max-width:1100px;margin:28px auto;padding:0 16px}
.feat-card{
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 14px;
  overflow: hidden;
  box-shadow: var(--shadow);
  margin-bottom: 16px;
  backdrop-filter: blur(6px);
}
.feat-head{
   background: linear-gradient(90deg, var(--mavi), var(--mor));
  color:#10204a;
  border-bottom: 2px solid #f4d78a;
  padding: 10px 14px;
}
.feat-title{display:inline-flex;gap:10px;align-items:center;font-weight:700;font-size:18px}

.feat-row{
  display:grid;grid-template-columns:1fr auto;gap:12px;align-items:center;
  padding:14px;background:rgba(255,255,255,.02);
  border-top:1px solid var(--border);
}
.feat-row:nth-child(even){background:rgba(255,255,255,.03)}
.feat-col{min-width:0}
.feat-name{font-weight:600;color:#fff}
.feat-desc{color:#cfd7ff;margin-top:4px;line-height:1.55}

.feat-ok{
  width:40px;height:40px;display:flex;align-items:center;justify-content:center;
  border-radius:10px;background:rgba(16,185,129,.14);color:#10b981;
  border:1px solid rgba(16,185,129,.28);font-size:18px
}

/* =========================
   Features (Özellikler) - Responsive
   ========================= */

/* Tablet ve daha küçük ekranlar (≤992px) */
@media (max-width: 992px) {
  .features {
    padding: 0 12px;
    margin: 24px auto;
  }

  .feat-title {
    font-size: 16px;
  }

  .feat-row {
    grid-template-columns: 1fr auto; /* aynı kalsın ama aralık daralsın */
    gap: 10px;
    padding: 12px;
  }

  .feat-ok {
    width: 36px;
    height: 36px;
    font-size: 16px;
  }
}

/* Telefon (≤768px) */
@media (max-width: 768px) {
  .features {
    padding: 0 10px;
    margin: 20px auto;
  }

  .feat-card {
    border-radius: 12px;
    margin-bottom: 14px;
  }

  .feat-head {
    padding: 8px 12px;
  }

  .feat-title {
    font-size: 15px;
    gap: 8px;
  }

  .feat-row {
    grid-template-columns: 1fr;   /* tek kolon */
    text-align: left;
    padding: 12px;
  }

  .feat-name {
    font-size: 14px;
  }

  .feat-desc {
    font-size: 13px;
    margin-top: 3px;
  }

  .feat-ok {
    margin-top: 8px;  /* ikon altta görünsün */
    width: 34px;
    height: 34px;
    font-size: 15px;
  }
}

/* Küçük telefon (≤576px) */
@media (max-width: 576px) {
  .feat-card {
    border-radius: 10px;
  }

  .feat-head {
    padding: 7px 10px;
  }

  .feat-title {
    font-size: 14px;
  }

  .feat-row {
    padding: 10px;
    gap: 8px;
  }

  .feat-name {
    font-size: 13px;
  }

  .feat-desc {
    font-size: 12.5px;
    line-height: 1.5;
  }

  .feat-ok {
    width: 30px;
    height: 30px;
    font-size: 14px;
  }
}

/* Çok küçük cihazlar (≤400px) */
@media (max-width: 400px) {
  .feat-title {
    font-size: 13.5px;
  }

  .feat-row {
    padding: 9px;
  }

  .feat-name {
    font-size: 12.5px;
  }

  .feat-desc {
    font-size: 12px;
  }

  .feat-ok {
    width: 28px;
    height: 28px;
    font-size: 13px;
  }
}



    </style>
</head>
<body>
     <uc:Header ID="Header1" runat="server" />
    <form id="form1" runat="server">
     <div>
  <section class="features">

    <!-- GRUP 1: Hosting & Site Performansı -->
    <div class="feat-card">
      <div class="feat-head">
        <span class="feat-title"><i class="fa-solid fa-rocket"></i> Hosting & Site Performansı</span>
      </div>

      <div class="feat-row">
        <div class="feat-col">
          <div class="feat-name">Hosting Dahil</div>
          <div class="feat-desc">Güçlü, güvenli ve yüksek performanslı bulut sunucularda barındırma.</div>
        </div>
        <div class="feat-ok" aria-label="Var"><i class="fa-solid fa-check"></i></div>
      </div>

      <div class="feat-row">
        <div class="feat-col">
          <div class="feat-name">Kurumsal E-Posta</div>
          <div class="feat-desc">Alan adına özel e-posta adresleri, IMAP/POP3, webmail ve kolay yönetim.</div>
        </div>
        <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
      </div>

      <div class="feat-row">
        <div class="feat-col">
          <div class="feat-name">Ücretsiz SSL</div>
          <div class="feat-desc">Otomatik Let’s Encrypt; tarayıcılarda güvenli olarak işaretlenir.</div>
        </div>
        <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
      </div>

      <div class="feat-row">
        <div class="feat-col">
          <div class="feat-name">Yavaş Yükleme Yok</div>
          <div class="feat-desc">CDN + önbellekleme ile hızlı ve akıcı deneyim.</div>
        </div>
        <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
      </div>

      <div class="feat-row">
        <div class="feat-col">
          <div class="feat-name">Mükemmel Mobil Uyumluluk</div>
          <div class="feat-desc">Tüm cihazlarda piksel netliğinde responsive arayüz.</div>
        </div>
        <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
      </div>
    </div>

    <!-- GRUP 2: Tasarım & İçerik -->
    <div class="feat-card">
      <div class="feat-head">
        <span class="feat-title"><i class="fa-solid fa-pen-ruler"></i> Tasarım & İçerik</span>
      </div>

      <div class="feat-row">
        <div class="feat-col">
          <div class="feat-name">Kişiselleştirilmiş / Hazır Şablon</div>
          <div class="feat-desc">Neon-pastel stile uygun, marka renklerinle hızlı yayına çık.</div>
        </div>
        <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
      </div>

      <div class="feat-row">
        <div class="feat-col">
          <div class="feat-name">SEO Temelleri</div>
          <div class="feat-desc">Meta etiketleri, semantik HTML, robots.txt ve site haritası.</div>
        </div>
        <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
      </div>

      <div class="feat-row">
        <div class="feat-col">
          <div class="feat-name">Erişilebilirlik</div>
          <div class="feat-desc">Kontrast, klavye ile gezinme ve ARIA rehberlerine uygunluk.</div>
        </div>
        <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
      </div>

      <div class="feat-row">
        <div class="feat-col">
          <div class="feat-name">İçerik Kurulumu</div>
          <div class="feat-desc">Başlangıç metinleri, menü/sayfa hiyerarşisi ve medya optimizasyonu.</div>
        </div>
        <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
      </div>
    </div>

<!-- GRUP 3: E-Ticaret -->
<div class="feat-card">
  <div class="feat-head">
    <span class="feat-title"><i class="fa-solid fa-cart-shopping"></i> E-Ticaret</span>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Ürün & Kategori Yönetimi</div>
      <div class="feat-desc">Sınırsız ürün, varyant, stok ve kategori oluşturma.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Ödeme Entegrasyonları</div>
      <div class="feat-desc">Iyzico, PayTR, Stripe vb. güvenli ve hızlı ödeme.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Kargo & Fatura</div>
      <div class="feat-desc">Kargo firmalarıyla entegrasyon, otomatik e-fatura desteği.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Kupon & Kampanya</div>
      <div class="feat-desc">İndirim kuponu, sepet kampanyası ve üyeye özel fiyat.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>
</div>

<!-- GRUP 4: Güvenlik & Bakım -->
<div class="feat-card">
  <div class="feat-head">
    <span class="feat-title"><i class="fa-solid fa-shield-halved"></i> Güvenlik & Bakım</span>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Günlük Yedekleme</div>
      <div class="feat-desc">Otomatik yedekleme ve hızlı geri yükleme seçenekleri.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">WAF & DDoS Koruması</div>
      <div class="feat-desc">Uygulama güvenlik duvarı ve trafik anomali korumaları.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Oturum & Yetkilendirme</div>
      <div class="feat-desc">Rol bazlı erişim, 2FA ve güvenli oturum yönetimi.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Sürüm Güncellemeleri</div>
      <div class="feat-desc">Çekirdek ve eklentiler için düzenli bakım/güncelleme.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>
</div>

<!-- GRUP 5: Entegrasyonlar -->
<div class="feat-card">
  <div class="feat-head">
    <span class="feat-title"><i class="fa-solid fa-plug"></i> Entegrasyonlar</span>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Google Analytics & Search Console</div>
      <div class="feat-desc">Trafik ve SEO performansını tek yerden takip.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Meta Pixel & Dönüşüm Etiketleri</div>
      <div class="feat-desc">Reklam dönüşümlerini ölç, hedeflemeyi güçlendir.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Harita & WhatsApp</div>
      <div class="feat-desc">Google Maps ve WhatsApp hızlı iletişim butonları.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">E-posta Servisleri</div>
      <div class="feat-desc">SMTP, SendGrid, Mailgun ile yüksek teslimat oranı.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>
</div>

<!-- GRUP 6: Performans & Analitik -->
<div class="feat-card">
  <div class="feat-head">
    <span class="feat-title"><i class="fa-solid fa-gauge-high"></i> Performans & Analitik</span>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">CDN & Önbellekleme</div>
      <div class="feat-desc">Global CDN ile düşük gecikme ve statik içerik hızlandırma.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Görsel Optimizasyon</div>
      <div class="feat-desc">WebP/AVIF, lazy-load ve otomatik boyutlandırma.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Raporlama</div>
      <div class="feat-desc">Sayfa görüntüleme, dönüşüm, form gönderimi raporları.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>
</div>

<!-- GRUP 7: İçerik Yönetimi & SEO -->
<div class="feat-card">
  <div class="feat-head">
    <span class="feat-title"><i class="fa-solid fa-file-pen"></i> İçerik Yönetimi & SEO</span>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Kolay CMS</div>
      <div class="feat-desc">Sayfa/Sekme, blog, medya ve menü yönetimi.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Zengin Meta & Schema</div>
      <div class="feat-desc">Meta başlık/açıklama, OpenGraph ve Schema.org veri işaretleme.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Çok Dilli Altyapı</div>
      <div class="feat-desc">TR/EN başta olmak üzere çoklu dil ve URL yapısı desteği.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>
</div>

<!-- GRUP 8: Destek & Garanti -->
<div class="feat-card">
  <div class="feat-head">
    <span class="feat-title"><i class="fa-solid fa-headset"></i> Destek & Garanti</span>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Kurulum & Eğitim</div>
      <div class="feat-desc">Canlı eğitim ve yazılı dokümantasyon ile hızlı başlangıç.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Öncelikli Destek</div>
      <div class="feat-desc">E-posta & WhatsApp üzerinden SLA’li destek.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>

  <div class="feat-row">
    <div class="feat-col">
      <div class="feat-name">Garanti & Sözleşme</div>
      <div class="feat-desc">Hizmet seviyesi, güvenlik ve gizlilik taahhütleri.</div>
    </div>
    <div class="feat-ok"><i class="fa-solid fa-check"></i></div>
  </div>
</div>

  </section>
</div>

    </form>

      <uc:Footer ID="Footer1" runat="server" />
    
    <uc:ContactWidget ID="ContactWidget1" runat="server" />
</body>
</html>
