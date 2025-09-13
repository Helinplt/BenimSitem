<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="musterigirisi.aspx.cs" Inherits="BenimSitem.musterigirisi" %>
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
<title>Müşteri Girişi</title>

<style>
:root{
  --mor:#7c4dff; --pembe:#ff6ec7; --mavi:#5ec5ff; --lacivert:#0c1b4d; --gece:#0b1020;
  --acik:#f7f9fc; --beyaz:#fff; --metin:#e8ecf7; --metin2:rgba(232,236,247,.85);
  --card:rgba(255,255,255,.06); --card2:rgba(255,255,255,.03); --border:rgba(255,255,255,.16);
  --shadow:0 20px 60px rgba(12,27,77,.38);
  --radius:18px; --radius-lg:22px;
  --grad-arka:
    radial-gradient(1100px 520px at 8% -10%, rgba(124,77,255,.22), transparent 60%),
    radial-gradient(900px 420px at 92% -20%, rgba(255,110,199,.18), transparent 60%),
    linear-gradient(180deg, #0a0f2a 0%, #0c1334 52%, #101944 100%);
  --grad-cta:linear-gradient(135deg, var(--pembe), var(--mor));
}
@media (prefers-color-scheme: light){
  :root{
    --gece:#f5f7ff; --metin:#0c1b4d; --metin2:rgba(12,27,77,.75);
    --card:rgba(12,27,77,.06); --card2:rgba(12,27,77,.03); --border:rgba(12,27,77,.12);
    --grad-arka:
      radial-gradient(900px 420px at 8% -10%, rgba(124,77,255,.10), transparent 60%),
      radial-gradient(900px 420px at 92% -20%, rgba(255,110,199,.10), transparent 60%),
      linear-gradient(180deg, #f6f9ff 0%, #ffffff 60%, #ffffff 100%);
  }
}

*{box-sizing:border-box}
html,body{height:100%}
html{scroll-behavior:smooth}
body{
  margin:0; font-family:'Poppins',system-ui,-apple-system,Segoe UI,Roboto,sans-serif;
  color:var(--metin); background:var(--gece); background-image:var(--grad-arka);
  overflow-x:hidden;
}

/* Header ile arasında nefes alan hero */
.auth-hero{padding:46px 0 12px; text-align:center}
.auth-hero h1{margin:0; font-size:40px; letter-spacing:.2px; font-weight:700}
.auth-hero p{margin:8px 0 0; opacity:.9}

/* Merkez kart */
.container{max-width:1120px; margin:0 auto; padding:0 22px}
.auth-wrap{
  display:grid; grid-template-columns:1.1fr .9fr; gap:24px; align-items:stretch;
  margin:24px 0 70px;
}
@media (max-width:992px){ .auth-wrap{grid-template-columns:1fr} }

.card{
  background:linear-gradient(to bottom right, var(--card), var(--card2));
  border:1px solid var(--border); border-radius:var(--radius-lg);
  box-shadow:var(--shadow); backdrop-filter:blur(8px);
}

/* Sol sütun: görsel / mesaj */
/* Yeni varyasyon v2 */
.side-visual.v2{ padding:26px; gap:14px; display:flex; flex-direction:column }
.side-visual.v2 .sv-head h2{ font-size:28px; margin:12px 0 6px }
.side-visual.v2 .sv-head p{ opacity:.95; line-height:1.75; margin:0 }

.sv-list{ list-style:none; padding:0; margin:6px 0 0; display:grid; gap:8px }
.sv-list li{ display:flex; align-items:center; gap:10px; opacity:.95 }
.sv-list i{ color:var(--mavi) }

.sv-safe{ display:flex; gap:8px; flex-wrap:wrap; margin-top:10px }
.chip{
  display:inline-flex; align-items:center; gap:8px; font-weight:600; font-size:12px;
  padding:8px 10px; border-radius:999px; background:var(--card); border:1px solid var(--border);
}

/* İllüstrasyon alanını zenginleştir */
.side-visual.v2 .illus{
  position:relative; margin-top:12px; border-radius:16px; border:1px solid var(--border);
  min-height:220px; overflow:hidden;
  background:
    radial-gradient(500px 260px at 10% 0%, rgba(124,77,255,.35), transparent 60%),
    radial-gradient(460px 260px at 90% 20%, rgba(94,197,255,.25), transparent 60%),
    linear-gradient(145deg, rgba(255,255,255,.06), rgba(255,255,255,.02));
}

/* Hareketli renk bulutları */
.blob{
  position:absolute; width:180px; height:180px; border-radius:50%;
  filter: blur(22px); opacity:.55; mix-blend-mode:screen;
  background:var(--grad-cta);
  animation:floatBlob 9s ease-in-out infinite;
}
.blob-a{ left:-30px; top:-20px }
.blob-b{ right:-25px; bottom:-25px; animation-direction:reverse; animation-duration:11s }

@keyframes floatBlob{
  0%,100%{ transform:translate(0,0) scale(1) }
  50%{ transform:translate(12px, -10px) scale(1.08) }
}

/* İnce grid overlay */
.grid-overlay{
  position:absolute; inset:0; opacity:.45; pointer-events:none;
  background:
    repeating-linear-gradient(to right, rgba(255,255,255,.06) 0 1px, transparent 1px 18px),
    repeating-linear-gradient(to bottom, rgba(255,255,255,.05) 0 1px, transparent 1px 18px);
  mix-blend-mode:overlay;
}

/* Var olan .tag ile uyum */
.side-visual.v2 .tag{
  align-self:flex-start;
  background:rgba(255,255,255,.08);
  border:1px dashed var(--border);
}

/* Mobil dokunuşlar */
@media (max-width:768px){
  .side-visual.v2{ padding:20px }
  .side-visual.v2 .sv-head h2{ font-size:24px }
  .side-visual.v2 .illus{ min-height:180px }
}

/* Sağ sütun: form */
.form-pane{padding:26px}
.tabs{
  display:flex; gap:10px; padding:6px; border-radius:14px;
  background:rgba(255,255,255,.06); border:1px solid var(--border);
  width:fit-content; margin:0 auto 14px;
}
.tab-btn{
  appearance:none; border:0; padding:10px 14px; border-radius:12px; cursor:pointer;
  font-weight:700; color:var(--metin2); background:transparent; transition:all .15s ease;
}
.tab-btn.active{ color:#fff; background:var(--grad-cta); box-shadow:0 10px 22px rgba(124,77,255,.36) }

.form-title{ text-align:center; margin:6px 0 18px; font-size:22px; font-weight:700 }
.form-grid{ display:grid; gap:14px }
.field{
  display:flex; flex-direction:column; gap:8px;
}
.label{ font-size:13px; opacity:.9; display:flex; align-items:center; gap:8px }
.input{
  width:100%; padding:12px 14px; border-radius:12px; color:var(--metin);
  border:1px solid var(--border); background:rgba(255,255,255,.08);
  outline:none; transition:box-shadow .15s ease, border-color .15s ease;
}
.input:focus{ border-color:rgba(94,197,255,.55); box-shadow:0 0 0 4px rgba(94,197,255,.20) }

.inline{
  display:flex; justify-content:space-between; align-items:center; gap:12px; flex-wrap:wrap;
}
.checkbox{ display:flex; align-items:center; gap:10px; font-size:14px; opacity:.95 }
.checkbox input{ width:18px; height:18px }

.btn-primary{
  display:inline-flex; align-items:center; justify-content:center; gap:10px;
  width:100%; padding:12px 16px; border-radius:14px; border:1px solid rgba(255,255,255,.16);
  background:var(--grad-cta); color:#fff; font-weight:700; text-decoration:none;
  box-shadow:0 14px 28px rgba(124,77,255,.35); transition:transform .15s ease, box-shadow .2s ease
}
.btn-primary:hover{ transform:translateY(-2px); box-shadow:0 20px 36px rgba(124,77,255,.42) }

.alt-actions{ display:flex; justify-content:space-between; gap:12px; margin-top:10px; flex-wrap:wrap }
.link{ color:#fff; text-decoration:none; border-bottom:1px dashed rgba(255,255,255,.45) }
.link:hover{ opacity:.9 }

.divider{
  display:flex; align-items:center; gap:12px; margin:18px 0 10px; opacity:.8
}
.divider::before, .divider::after{
  content:""; height:1px; flex:1; background:var(--border);
}

.socials{ display:flex; gap:12px; flex-wrap:wrap }
.sbtn{
  flex:1 1 140px; display:flex; align-items:center; justify-content:center; gap:10px;
  padding:10px 12px; border-radius:12px; border:1px solid var(--border);
  background:rgba(255,255,255,.06); color:#fff; text-decoration:none; font-weight:600;
}
.sbtn i{ min-width:18px }

/* Gizli paneller */
.panel{ display:none; }
.panel.active{ display:block; }

/* Mobil ayarlar */
@media (max-width:768px){
  .auth-hero h1{font-size:32px}
  .side-visual{padding:20px}
  .form-pane{padding:20px}
}

/* Klavye odağı */
a:focus-visible, button:focus-visible, .input:focus-visible{
  outline:3px solid rgba(94,197,255,.65); outline-offset:2px
}
</style>
</head>
<body>
  <uc:Header ID="Header1" runat="server" />

  <form id="form1" runat="server">
    <section class="auth-hero">
      <div class="container">
        <h1>Müşteri Girişi</h1>
        <p>Hesabına giriş yap veya bir dakikada kayıt ol.</p>
      </div>
    </section>

    <section class="container">
      <div class="auth-wrap">
        <!-- SOL: Tanıtım / Görsel -->
       <aside class="card side-visual v2" aria-label="Bilgi Paneli">
  <!-- Üst rozet -->
  <span class="tag">
    <i class="fa-solid fa-sparkles"></i> Helin Stdio Ayrıcalıkları  ile tanış!  
  </span>

  <!-- Başlık + metin -->
  <div class="sv-head">
    <h2>Tek Hesap, Tüm Hizmetler</h2>
    <p>Satın aldığın şablonları yönet, lisans ve faturaları gör, destek taleplerini tek yerden takip et.</p>
  </div>

  <!-- Mini özellik listesi -->
  <ul class="sv-list">
    <li><i class="fa-solid fa-check"></i> Tek seferde hızlı giriş</li>
    <li><i class="fa-solid fa-check"></i> Lisans & fatura arşivi</li>
    <li><i class="fa-solid fa-check"></i> Öncelikli teknik destek</li>
  </ul>

  <!-- Görsel alan (animasyonlu arka plan + dekor) -->
  <div class="illus" aria-hidden="true">
    <div class="blob blob-a"></div>
    <div class="blob blob-b"></div>
    <div class="grid-overlay"></div>
  </div>

  <!-- Alt güven satırı -->
  <div class="sv-safe">
    <span class="chip"><i class="fa-solid fa-shield-heart"></i> KVKK Uyumlu</span>
    <span class="chip"><i class="fa-solid fa-rotate-left"></i> 7 Gün İade</span>
    <span class="chip"><i class="fa-solid fa-lock"></i> SSL Güvenli</span>
  </div>
</aside>


        <!-- SAĞ: Form Kartı -->
        <section class="card form-pane" aria-label="Giriş ve Kayıt">
          <!-- Sekmeler -->
          <div class="tabs" role="tablist" aria-label="Giriş veya Kayıt">
            <button id="tab-login" class="tab-btn active" type="button" role="tab" aria-selected="true" aria-controls="panel-login">
              <i class="fa-solid fa-right-to-bracket"></i> Giriş Yap
            </button>
            <button id="tab-register" class="tab-btn" type="button" role="tab" aria-selected="false" aria-controls="panel-register">
              <i class="fa-solid fa-user-plus"></i> Kayıt Ol
            </button>
          </div>

          <!-- GİRİŞ PANELİ -->
          <div id="panel-login" class="panel active" role="tabpanel" aria-labelledby="tab-login">
            <h3 class="form-title">Hesabına Giriş Yap</h3>
            <div class="form-grid">
              <div class="field">
                <label class="label" for="<%= txtLoginEmail.ClientID %>"><i class="fa-solid fa-envelope"></i> E-posta</label>
                <asp:TextBox ID="txtLoginEmail" runat="server" CssClass="input" TextMode="Email" placeholder="ornek@eposta.com"></asp:TextBox>
              </div>

              <div class="field">
                <label class="label" for="<%= txtLoginPassword.ClientID %>"><i class="fa-solid fa-lock"></i> Şifre</label>
                <div style="position:relative">
                  <asp:TextBox ID="txtLoginPassword" runat="server" CssClass="input" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                  <button type="button" class="link" onclick="togglePwd('<%= txtLoginPassword.ClientID %>')" style="position:absolute; right:10px; top:50%; transform:translateY(-50%); border:0; background:transparent;"><i class="fa-regular fa-eye"></i></button>
                </div>
              </div>

              <div class="inline">
                <label class="checkbox">
                  <asp:CheckBox ID="chkRemember" runat="server" /> Beni hatırla
                </label>
                <a class="link" href="ForgotPassword.aspx"><i class="fa-regular fa-circle-question"></i> Şifremi unuttum</a>
              </div>

           <asp:Button ID="btnLogin" runat="server" Text="Giriş Yap" CssClass="btn-primary" />

              <div class="divider"><span>veya</span></div>
              <div class="socials">
                <a class="sbtn" href="#"><i class="fa-brands fa-google"></i> Google ile devam et</a>
                <a class="sbtn" href="#"><i class="fa-brands fa-apple"></i> Apple ile devam et</a>
              </div>
            </div>
          </div>

          <!-- KAYIT PANELİ -->
          <div id="panel-register" class="panel" role="tabpanel" aria-labelledby="tab-register" aria-hidden="true">
            <h3 class="form-title">Yeni Hesap Oluştur</h3>
            <div class="form-grid">
              <div class="field">
                <label class="label" for="<%= txtRegName.ClientID %>"><i class="fa-solid fa-user"></i> Ad Soyad</label>
                <asp:TextBox ID="txtRegName" runat="server" CssClass="input" placeholder="Adınız Soyadınız"></asp:TextBox>
              </div>

              <div class="field">
                <label class="label" for="<%= txtRegEmail.ClientID %>"><i class="fa-solid fa-envelope"></i> E-posta</label>
                <asp:TextBox ID="txtRegEmail" runat="server" CssClass="input" TextMode="Email" placeholder="ornek@eposta.com"></asp:TextBox>
              </div>

              <div class="field">
                <label class="label" for="<%= txtRegPhone.ClientID %>"><i class="fa-solid fa-phone"></i> Telefon (opsiyonel)</label>
                <asp:TextBox ID="txtRegPhone" runat="server" CssClass="input" placeholder="+90 5xx xxx xx xx"></asp:TextBox>
              </div>

              <div class="field">
                <label class="label" for="<%= txtRegPassword.ClientID %>"><i class="fa-solid fa-lock"></i> Şifre</label>
                <div style="position:relative">
                  <asp:TextBox ID="txtRegPassword" runat="server" CssClass="input" TextMode="Password" placeholder="En az 8 karakter"></asp:TextBox>
                  <button type="button" class="link" onclick="togglePwd('<%= txtRegPassword.ClientID %>')" style="position:absolute; right:10px; top:50%; transform:translateY(-50%); border:0; background:transparent;"><i class="fa-regular fa-eye"></i></button>
                </div>
              </div>

              <div class="field">
                <label class="label" for="<%= txtRegPassword2.ClientID %>"><i class="fa-solid fa-lock-keyhole"></i> Şifre (Tekrar)</label>
                <div style="position:relative">
                  <asp:TextBox ID="txtRegPassword2" runat="server" CssClass="input" TextMode="Password" placeholder="Şifreni tekrar gir"></asp:TextBox>
                  <button type="button" class="link" onclick="togglePwd('<%= txtRegPassword2.ClientID %>')" style="position:absolute; right:10px; top:50%; transform:translateY(-50%); border:0; background:transparent;"><i class="fa-regular fa-eye"></i></button>
                </div>
              </div>

             <asp:Button ID="btnRegister" runat="server" Text="Kayıt Ol" CssClass="btn-primary" />

              <div class="divider"><span>veya</span></div>
              <div class="socials">
                <a class="sbtn" href="#"><i class="fa-brands fa-google"></i> Google ile devam et</a>
                <a class="sbtn" href="#"><i class="fa-brands fa-apple"></i> Apple ile devam et</a>
              </div>

              <div class="alt-actions" style="margin-top:6px">
                <span class="label" style="opacity:.9">Zaten üye misin?</span>
                <a class="link" href="#" onclick="switchTab('login');return false;"><i class="fa-solid fa-right-to-bracket"></i> Giriş yap</a>
              </div>
            </div>
          </div>
        </section>
      </div>
    </section>
  </form>

  <uc:ContactWidget ID="ContactWidget1" runat="server" />
  <uc:Footer ID="Footer1" runat="server" />

<script>
(function(){
  const tabLogin = document.getElementById('tab-login');
  const tabRegister = document.getElementById('tab-register');
  const panelLogin = document.getElementById('panel-login');
  const panelRegister = document.getElementById('panel-register');

  window.switchTab = function(which){
    const toLogin = which === 'login';
    tabLogin.classList.toggle('active', toLogin);
    tabRegister.classList.toggle('active', !toLogin);
    tabLogin.setAttribute('aria-selected', toLogin);
    tabRegister.setAttribute('aria-selected', !toLogin);

    panelLogin.classList.toggle('active', toLogin);
    panelRegister.classList.toggle('active', !toLogin);
    panelRegister.setAttribute('aria-hidden', toLogin ? 'true' : 'false');
    panelLogin.setAttribute('aria-hidden', toLogin ? 'false' : 'true');
  };

  tabLogin.addEventListener('click', ()=>switchTab('login'));
  tabRegister.addEventListener('click', ()=>switchTab('register'));

  // URL ile ?tab=register gelirse otomatik kayıt sekmesine geç
  try{
    const url = new URL(window.location.href);
    if((url.searchParams.get('tab')||'').toLowerCase()==='register'){ switchTab('register'); }
  }catch(e){}
})();

// Şifre göz butonu
function togglePwd(id){
  const el = document.getElementById(id);
  if(!el) return;
  el.type = el.type === 'password' ? 'text' : 'password';
}
</script>
</body>
</html>
