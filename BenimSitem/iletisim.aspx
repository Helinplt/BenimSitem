<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="BenimSitem.iletisim" %>
<%@ Register Src="~/ContactWidget.ascx" TagName="ContactWidget" TagPrefix="uc" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="tr">
<head runat="server">
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>
<title>İletişim</title>

<style>
:root{
  --mor:#7c4dff; --pembe:#ff6ec7; --mavi:#5ec5ff;
  --gece:#0b1020; --beyaz:#ffffff;
  --ink: #e8ecf7; --muted:#aeb9e8;
  --card:rgba(255,255,255,.08); --border:rgba(255,255,255,.16);
  --radius:16px; --shadow:0 10px 28px rgba(12,27,77,.22);
  --grad-hero: linear-gradient(180deg,#0a0f2a 0%, #0c1334 50%, #101944 100%);
  --grad-cta: linear-gradient(135deg, var(--pembe), var(--mor));
}

/* base */
*{ box-sizing:border-box }
html,body{ height:100% }
body{ margin:0; font-family:Poppins,system-ui,-apple-system,Segoe UI,Roboto,sans-serif; color:var(--ink); background:var(--gece) }
a{ color:inherit; text-decoration:none }
img{ max-width:100%; display:block }

/* utils */
.wrap{ max-width:1040px; margin:0 auto; padding:0 18px }
.stack{ display:flex; flex-direction:column; gap:14px }
.grid-2{ display:grid; grid-template-columns:1fr 1fr; gap:18px }
.center{ display:flex; align-items:center; justify-content:center }

/* focus */
:focus-visible{ outline:2px solid color-mix(in oklab, var(--mavi) 75%, white 15%); outline-offset:3px; border-radius:10px }

/* hero (daha sade) */
.hero{ background:var(--grad-hero); padding:26px 0 18px; box-shadow:inset 0 -1px 0 rgba(255,255,255,.06) }
.breadcrumb{ color:#9fb3ff; font-size:13px; display:flex; gap:8px; align-items:center; opacity:.95 }
.breadcrumb a{ color:#cfe0ff }
.title{ margin:10px 0 6px; font-size:28px; font-weight:700; letter-spacing:.2px }
.sub{ margin:0; color:#cfd7ff; font-size:14px }

/* kart */
.card{
  background:var(--card);
  border:1px solid var(--border);
  border-radius:var(--radius);
  box-shadow:var(--shadow);
}
.card-h{ padding:14px 16px; border-bottom:1px solid rgba(255,255,255,.10); font-weight:700 }
.card-c{ padding:16px }

/* form (sade) */
.form{ display:grid; grid-template-columns:1fr 1fr; gap:12px }
.form .full{ grid-column:1 / -1 }
.label{ font-size:13px; color:#cfe0ff; margin:0 0 6px; display:block }
.input, .textarea{
  width:100%; border:1px solid rgba(255,255,255,.14); background:rgba(255,255,255,.06);
  color:#fff; border-radius:12px; padding:12px 12px; font-size:14px; outline:none;
}
.textarea{ min-height:130px; resize:vertical }
.help{ font-size:12px; color:var(--muted); margin-top:6px }
.actions{ margin-top:4px; display:flex; gap:10px; align-items:center; justify-content:space-between; flex-wrap:wrap }

/* button */
.btn{
  display:inline-flex; align-items:center; gap:8px;
  padding:12px 16px; font-weight:700; border:0; border-radius:12px; cursor:pointer;
  background:var(--grad-cta); color:#fff; box-shadow:0 10px 24px rgba(124,77,255,.28)
}

/* info list */
.info{ display:flex; flex-direction:column; gap:10px; margin:0; padding:0; list-style:none }
.info li{
  display:flex; gap:10px; align-items:flex-start;
  background:rgba(255,255,255,.05); border:1px solid rgba(255,255,255,.12);
  border-radius:12px; padding:12px 14px;
}
.info i{ color:var(--mavi); margin-top:2px }
.info a{ text-decoration:underline }

/* map */
.map{ height:280px; border-radius:12px; border:1px solid rgba(255,255,255,.12); overflow:hidden; background:rgba(255,255,255,.04) }

/* alt bilgi */
.strip{ margin:16px 0 28px; padding:12px 14px; text-align:center; border-radius:12px;
  background:linear-gradient(90deg, rgba(94,197,255,.18), rgba(124,77,255,.18));
  border:1px solid rgba(255,255,255,.14)
}

/* alerts */
.alert{ display:none; padding:10px 12px; border-radius:10px; font-size:14px }
.alert.ok{ display:block; background:rgba(94,197,255,.18); border:1px solid rgba(94,197,255,.35) }
.alert.err{ display:block; background:rgba(255,110,199,.18); border:1px solid rgba(255,110,199,.35) }

/* responsive – basit */
@media (max-width: 900px){
  .grid-2{ grid-template-columns:1fr }
  .form{ grid-template-columns:1fr }
  .map{ height:240px }
}
@supports(padding:max(env(safe-area-inset-left),0px)){
  .wrap{ padding-left:max(16px, env(safe-area-inset-left)); padding-right:max(16px, env(safe-area-inset-right)) }
}
@media (prefers-reduced-motion: reduce){
  .btn, .card{ transition:none !important }
}
</style>
</head>

<body>
  <uc:Header ID="Header1" runat="server" />

  <form id="form1" runat="server">
    <!-- HERO -->
    <section class="hero">
      <div class="wrap stack">
        <nav class="breadcrumb" aria-label="Breadcrumb">
          <a href="anasayfa.aspx">Ana Sayfa</a>
          <i class="fa-solid fa-chevron-right" style="font-size:11px;opacity:.8"></i>
          <span>İletişim</span>
        </nav>
        <h1 class="title"><i class="fa-solid fa-message" style="color:#9fcfff"></i> Bizimle İletişime Geç</h1>
        <p class="sub">Kısa formu doldur, ekibimiz en kısa sürede geri dönüş yapsın.</p>
      </div>
    </section>

    <!-- CONTENT -->
    <section style="padding:22px 0 34px">
      <div class="wrap grid-2">
        <!-- FORM -->
        <section class="card">
          <div class="card-h">İletişim Formu</div>
          <div class="card-c">
            <div id="ok" class="alert ok" role="status" style="display:none">Mesajın alındı! En kısa sürede dönüş yapacağız.</div>
            <div id="err" class="alert err" role="alert" style="display:none">Lütfen zorunlu alanları kontrol et.</div>

            <div id="contactForm" class="form">
              <div>
                <label for="adsoyad" class="label">Ad Soyad</label>
                <input id="adsoyad" class="input" type="text" placeholder="Adınız Soyadınız" required/>
              </div>
              <div>
                <label for="email" class="label">E-posta</label>
                <input id="email" class="input" type="email" placeholder="ornek@site.com" required/>
                <div class="help">Yanıt için bu adresi kullanırız.</div>
              </div>
              <div>
                <label for="telefon" class="label">Telefon (opsiyonel)</label>
                <input id="telefon" class="input" type="tel" placeholder="+90 5xx xxx xx xx" pattern="^[0-9+()\\s-]{8,}$"/>
              </div>
              <div>
                <label for="konu" class="label">Konu</label>
                <input id="konu" class="input" type="text" placeholder="Kısa konu başlığı" required/>
              </div>
              <div class="full">
                <label for="mesaj" class="label">Mesaj</label>
                <textarea id="mesaj" class="textarea" placeholder="Bize nasıl yardımcı olabiliriz?" required></textarea>
              </div>
              <div class="full actions">
                <label style="display:flex;align-items:center;gap:8px;font-size:13px;color:#cfe0ff">
                  <input id="kvkk" type="checkbox" required/> KVKK metnini okudum ve onaylıyorum.
                </label>
                <button id="gonder" class="btn" type="submit"><i class="fa-solid fa-paper-plane"></i> Gönder</button>
              </div>
            </div>
          </div>
        </section>

        <!-- BİLGİ / HARİTA -->
        <aside class="card">
          <div class="card-h">İletişim Bilgileri</div>
          <div class="card-c stack">
            <ul class="info">
              <li><i class="fa-solid fa-phone"></i><div><div>Telefon</div><a href="tel:+902123334455">+90 (212) 333 44 55</a></div></li>
              <li><i class="fa-solid fa-envelope"></i><div><div>E-posta</div><a href="mailto:destek@benimsitem.com">destek@benimsitem.com</a></div></li>
              <li><i class="fa-solid fa-location-dot"></i><div><div>Adres</div><div>Örnek Mah. Tasarım Cad. No:10, İstanbul</div></div></li>
              <li><i class="fa-brands fa-whatsapp"></i><div><div>WhatsApp</div><a target="_blank" rel="noopener" href="https://wa.me/905551112233">+90 555 111 22 33</a></div></li>
            </ul>

         <div class="map">
  <iframe
    title="Harita"
    width="100%"
    height="100%"
    style="border:0; display:block"
    loading="lazy"
    referrerpolicy="no-referrer-when-downgrade"
    allowfullscreen
    src="https://www.google.com/maps?q=41.0082,28.9784&z=14&hl=tr&output=embed">
  </iframe>
</div>

          </div>
        </aside>
      </div>

      <div class="wrap">
        <div class="strip">Daha fazla bilgi için <a href="yardim.aspx" style="font-weight:700;text-decoration:underline">Yardım Merkezi</a>’ni ziyaret edebilirsin.</div>
      </div>
    </section>
  </form>

  <uc:ContactWidget ID="ContactWidget1" runat="server" />
  <uc:Footer ID="Footer1" runat="server" />

<script>
    /* Basit istemci doğrulama (demo) */
    (function () {
        const form = document.getElementById('contactForm');
        const ok = document.getElementById('ok');
        const err = document.getElementById('err');

        form.addEventListener('submit', function (e) {
            e.preventDefault(); // demo
            const req = ['adsoyad', 'email', 'konu', 'mesaj'];
            const valid = req.every(id => document.getElementById(id).value.trim()) &&
                document.getElementById('kvkk').checked;
            if (!valid) { ok.style.display = 'none'; err.style.display = 'block'; return; }
            err.style.display = 'none'; ok.style.display = 'block';
            form.reset();
        });
    })();
</script>
</body>
</html>
