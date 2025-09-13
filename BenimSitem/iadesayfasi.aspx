<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iadesayfasi.aspx.cs" Inherits="BenimSitem.iadesayfasi" %>
<%@ Register Src="~/ContactWidget.ascx" TagName="ContactWidget" TagPrefix="uc" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="tr">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>
  <title>7 Gün İade Garantisi</title>

  <style>
    /* === Temalar & Değerler === */
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


    /* === Genel Layout === */
    .container{max-width:1200px; margin:0 auto; padding:0 24px}
    .page-hero{
      position:relative; isolation:isolate;
      padding:56px 0 26px;
      border-bottom:1px solid var(--border);
      background:linear-gradient(180deg, rgba(255,255,255,.04), rgba(255,255,255,0));
    }
    .page-title{font-size:48px; line-height:1.14; font-weight:700; margin:0 0 10px; letter-spacing:.2px}
    .page-sub{margin:2px 0 0; opacity:.9; font-size:16px}

    .breadcrumb{
      display:flex; gap:10px; align-items:center; opacity:.85; font-size:14px; flex-wrap:wrap
    }
    .breadcrumb a{
      color:inherit; text-decoration:none; border-bottom:1px dashed var(--border);
    }
    .sep{opacity:.55}

    /* === İçerik Paneli === */
    .panel{
      background:linear-gradient( to bottom right, var(--card), var(--card2));
      border:1px solid var(--border); border-radius:var(--radius-lg);
      box-shadow:var(--shadow); padding:32px 30px; margin:28px 0 56px; backdrop-filter:blur(8px);
    }
    .panel h2{font-size:28px; margin:14px 0 12px; letter-spacing:.2px}
    .panel p{opacity:.95; line-height:1.75; margin:10px 0 16px}
    .panel ul{margin:10px 0 14px 18px}
    .panel li{margin:8px 0; line-height:1.72}

    .info{
      padding:12px 14px; border-radius:14px;
      background:var(--card); border:1px solid var(--border);
      display:flex; gap:12px; align-items:flex-start; margin:12px 0 18px
    }
    .info i{margin-top:2px; min-width:18px}
    .muted{opacity:.9}

    /* === Bölüm Başlığı + Vurgu Çizgisi === */
    .section-title{
      display:flex; align-items:center; gap:10px; font-weight:700; margin:18px 0 10px
    }
    .section-title .bar{
      height:12px; width:12px; border-radius:4px; background:var(--grad-vurgu);
      box-shadow:0 6px 16px rgba(124,77,255,.45);
    }

    /* === Grid === */
    .grid{display:grid; gap:18px}
    .grid-2{grid-template-columns:1fr 1fr}
    @media (max-width:1024px){ .grid-2{grid-template-columns:1fr} }

    /* === Rozetler === */
    .badges{display:flex; gap:10px; flex-wrap:wrap; margin-top:8px}
    .badge{
      padding:8px 12px; border-radius:999px; font-size:12px; font-weight:600;
      background:var(--card); border:1px solid var(--border); display:inline-flex; align-items:center; gap:8px
    }

    /* === Buton === */
    .btn{
      display:inline-flex; align-items:center; gap:10px; padding:12px 16px; border-radius:14px;
      border:1px solid rgba(255,255,255,.16); color:#fff; text-decoration:none; font-weight:600;
      background:var(--grad-vurgu); box-shadow:0 14px 28px rgba(124,77,255,.35); transition:transform .15s ease, box-shadow .2s ease
    }
    .btn:hover{transform:translateY(-2px); box-shadow:0 20px 36px rgba(124,77,255,.42)}

    /* === İç bağlantı vurgusu === */
    :target{
      scroll-margin-top:90px; /* header yüksekliği varsa faydalı */
      animation:focusPulse 1.8s ease 1;
      border-radius:12px;
    }
    @keyframes focusPulse{
      0%{box-shadow:0 0 0 0 rgba(124,77,255,.0)}
      40%{box-shadow:0 0 0 10px rgba(124,77,255,.18)}
      100%{box-shadow:0 0 0 0 rgba(124,77,255,0)}
    }

    /* === Küçük detay: zaman çizelgesi liste boşluğu === */
    .timeline li{margin:10px 0}

    /* === Mobil Uyarlamalar === */
    @media (max-width:900px){
      .page-title{font-size:38px}
      .panel{padding:26px 22px}
    }
    @media (max-width:600px){
      .page-title{font-size:32px}
      .page-hero{padding:44px 0 18px}
      .panel h2{font-size:22px}
      .panel p, .panel li{font-size:15px}
      .btn{padding:11px 14px}
    }

    /* === Erişilebilirlik: klavye odağı === */
    a:focus-visible, button:focus-visible{
      outline:3px solid rgba(94,197,255,.65); outline-offset:2px; border-radius:12px;
    }
  </style>
</head>
<body>
  <uc:Header ID="Header1" runat="server" />

  <form id="form1" runat="server">
    <!-- HERO -->
    <section class="page-hero">
      <div class="container">
        <h1 class="page-title">7 Gün İade Garantisi</h1>
        <p class="page-sub">Bulut Web Site’yi risksiz deneyin — memnun kalmazsanız 7 gün içinde iade.</p>
        <nav class="breadcrumb" aria-label="breadcrumb">
          <a href="anasayfa.aspx">Ana Sayfa</a>
          <span class="sep">/</span>
          <span aria-current="page">7 Gün İade Garantisi</span>
        </nav>
      </div>
    </section>

    <!-- PANEL: İçerik -->
    <section>
      <div class="container">
        <div class="panel">
          <h2 id="detaylar" class="section-title"><span class="bar"></span><span>Bulut Web Site’yi Eksiksiz Deneyin</span></h2>
          <p>
            Birçok sistemi demo ile test ederken tüm özellikleri tam değerlendirmek zor olabilir. Bizde ise
            sistemi satın aldıktan sonra <strong>7 gün boyunca</strong> tüm özellikleri gerçek ortamda deneyimleyebilirsiniz.
          </p>

          <h2 class="section-title"><span class="bar"></span><span>Para İade Garantisi Nasıl İşler?</span></h2>
          <p>
            Para iade garantimiz, <strong>satın alma tarihinden itibaren 7 gün</strong> geçerlidir. Örneğin satın alma tarihiniz
            1 Mayıs ise, <strong>6 Mayıs 23:59</strong>’a kadar bize ulaşmanız yeterlidir. Talebiniz alınır alınmaz süreci başlatır,
            erişim/kapanış ve faturalama güncellemelerini tamamladıktan sonra iadenizi bankanıza iletiriz.
          </p>

          <div class="info" role="note" aria-label="İade Süresi Bilgisi">
            <i class="fa-solid fa-clock-rotate-left" aria-hidden="true"></i>
            <div class="muted">
              İade, bankaların işlem sürelerine göre genellikle <strong>3–5 iş günü</strong> içinde kartınıza/hesabınıza yansır.
            </div>
          </div>

          <h2 class="section-title"><span class="bar"></span><span>İade Şartları Nelerdir?</span></h2>
          <p>
            İade garantimiz, sistemi risksiz denemeniz için tasarlanmıştır. Aşağıdaki durumlar politika kapsam ve istisnelerini açıklar:
          </p>

          <ul>
            <li>İade politikamız <strong>Bulut Web Site lisansını</strong> kapsar. Üçüncü taraf giderleri (domain, hosting, SSL, harici lisanslar) genel olarak iade kapsamı dışındadır.</li>
            <li><strong>Yayına alınmış</strong> ve aktif trafik/gelir elde eden projelerde, yalnızca <em>işçilik dışı</em> lisans bedelleri düşülerek kısmi iade uygulanabilir.</li>
            <li>Reklam, kampanya, e-posta hizmetleri ve müşteri toplama araçlarına yapılan harcamalar iade edilmez.</li>
            <li>Tarafınızca kesilecek <strong>iade faturası</strong> (kurumsal satın alımlarda) gereklidir.</li>
            <li>Kişiye özel yoğun geliştirme/entegrasyon başladıysa, yapılan işçilik bedeli düşülerek <strong>kısmi iade</strong> uygulanabilir.</li>
          </ul>

          <div class="grid grid-2" style="margin-top:16px">
            <div>
              <div class="section-title"><span class="bar"></span><span>İade Talebini Nasıl İletirim?</span></div>
              <p class="muted">
                <strong>1)</strong> Sipariş numaranız ve e-posta adresinizle bize ulaşın. <br/>
                <strong>2)</strong> Kısa bir neden/geri bildirim ekleyin (isteğe bağlı). <br/>
                <strong>3)</strong> Onay sonrası erişimler kapatılır, iade bankaya iletilir.
              </p>
              <div class="badges" aria-label="İletişim Kanalları">
                <span class="badge"><i class="fa-solid fa-envelope"></i> destek@ornek.com</span>
                <span class="badge"><i class="fa-brands fa-whatsapp"></i> +90 (5xx) xxx xx xx</span>
              </div>
            </div>

            <div>
              <div class="section-title"><span class="bar"></span><span>Zaman Çizelgesi (Özet)</span></div>
              <ul class="timeline">
                <li><strong>Gün 0:</strong> Satın alma</li>
                <li><strong>Gün 1–7:</strong> Cayma talebi</li>
                <li><strong>+1–2 İş Günü:</strong> İnceleme &amp; onay</li>
                <li><strong>+3–5 İş Günü:</strong> Banka iade yansıması</li>
              </ul>
              <a class="btn" href="mailto:destek@ornek.com" aria-label="E-posta ile iade talebi gönder">
                <i class="fa-solid fa-paper-plane" aria-hidden="true"></i> İade Talebi Gönder
              </a>
            </div>
          </div>

          <h2 class="section-title" style="margin-top:22px"><span class="bar"></span><span>Yasal / Notlar</span></h2>
          <div class="info" role="note" aria-label="Yasal Uyarı">
            <i class="fa-solid fa-scale-balanced" aria-hidden="true"></i>
            <div class="muted">
              Bu sayfa, <em>örnek iade politikası taslağıdır</em>. Kendi şirket unvanın, adresin ve sözleşme metinlerinle uyumlu
              hale getirmeni öneririz. Mesafeli satış/cayma hakkı kapsamındaki istisnaları (kişiye özel hizmet, ifaya başlanması vb.)
              politika metninde ayrıca belirt.
            </div>
          </div>
        </div>
      </div>
    </section>
  </form>

















































  <script>
    // Kullanıcı tercihini gözet: animasyon kapalıysa otomatik scroll efektleri yok.
    try{
      const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
      if(prefersReduced){ document.documentElement.style.scrollBehavior = 'auto'; }
    }catch(e){}
  </script>
</body>
</html>
