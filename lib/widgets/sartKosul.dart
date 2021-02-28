import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TermsState();
  }
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 35.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Text("Şartlar ve Koşullar",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 16.0, 16.0),
              child: Text(
                'Bu şartlar ve koşullar ("Şartlar", "Sözleşme"), Mobil Uygulama Geliştiricisi ("Mobil Uygulama Geliştiricisi", "biz", "biz" veya "bizim") ile siz ("Kullanıcı", "siz" veya "sizin"). Bu Sözleşme, Negotium mobil uygulamasını ve herhangi bir ürününü veya hizmetini (topluca "Mobil Uygulama" veya "Hizmetler") kullanımınızın genel hüküm ve koşullarını ortaya koymaktadır.',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            content("Hesaplar ve Üyelik",
                "Bu Mobil Uygulamayı kullanmak için en az 14 yaşında olmalısınız. Bu Mobil Uygulamayı kullanarak ve bu Sözleşmeyi kabul ederek en az 14 yaşında olduğunuzu garanti ve beyan etmektesiniz. Mobil Uygulamada bir hesap oluşturursanız, hesabınızın güvenliğini sağlamaktan siz sorumlusunuz ve hesap altında gerçekleşen tüm faaliyetlerden ve onunla bağlantılı olarak yapılan diğer işlemlerden tamamen siz sorumlusunuz. Siz oturum açmadan ve Hizmetlerimizi kullanmadan önce yeni hesapları izleyebilir ve inceleyebiliriz. Herhangi bir türde yanlış iletişim bilgisi sağlamak, hesabınızın feshedilmesine neden olabilir. Hesabınızın yetkisiz kullanımlarını veya diğer güvenlik ihlallerini derhal bize bildirmelisiniz. Bu tür eylemler veya ihmallerin bir sonucu olarak ortaya çıkan her türlü zarar da dahil olmak üzere tarafınızca yapılan herhangi bir eylem veya ihmalden sorumlu olmayacağız. Bu Sözleşmenin herhangi bir hükmünü ihlal ettiğinizi veya davranışınızın veya içeriğinizin itibarımıza ve iyi niyetimize zarar verme eğiliminde olduğunu belirlersek, hesabınızı (veya herhangi bir bölümünü) askıya alabilir, devre dışı bırakabilir veya silebiliriz."),
            content("Kullanıcı içeriği",
                "Hizmeti kullanırken Mobil Uygulamada gönderdiğiniz hiçbir veri, bilgi veya materyalin (\"İçerik\") sahibi değiliz. Gönderilen tüm İçeriğin doğruluğu, kalitesi, bütünlüğü, yasallığı, güvenilirliği, uygunluğu ve fikri mülkiyet sahipliği veya kullanım hakkından tamamen siz sorumlu olacaksınız. Sizin tarafınızdan Hizmetlerimiz kullanılarak gönderilen veya oluşturulan Mobil Uygulamadaki İçeriği izleyebilir ve inceleyebiliriz. Sizin tarafınızdan özel olarak izin verilmedikçe, Mobil Uygulamayı kullanmanız, ticari, pazarlama veya benzeri herhangi bir amaçla sizin tarafınızdan oluşturulan veya kullanıcı hesabınızda saklanan İçeriği kullanma, çoğaltma, uyarlama, değiştirme, yayınlama veya dağıtma lisansını bize vermez. Ancak, yalnızca Hizmetlerin size sağlanması amacıyla gerektiği şekilde kullanıcı hesabınızın İçeriğine erişme, kopyalama, dağıtma, saklama, iletme, yeniden biçimlendirme, görüntüleme ve gerçekleştirme izni veriyorsunuz. Bu beyanlardan veya garantilerden herhangi birini sınırlandırmadan, kendi takdirimize bağlı olarak, herhangi bir İçeriği reddetme veya kaldırma yükümlülüğümüz olmasa da makul görüşümüze göre politikalarımızdan herhangi birini ihlal eden veya herhangi bir şekilde zararlı olan herhangi bir İçeriği reddetme veya kaldırma hakkına sahibiz. veya sakıncalı."),
            content("Yedeklemeler",
                "İçeriği düzenli olarak yedekliyoruz ve bu yedeklemelerin eksiksizliğini ve doğruluğunu sağlamak için elimizden gelenin en iyisini yapacağız. Donanım arızası veya veri kaybı durumunda, etkiyi ve kesinti süresini en aza indirmek için yedeklemeleri otomatik olarak geri yükleyeceğiz."),
            content("Diğer mobil uygulamalara bağlantılar",
                "Bu Mobil Uygulama diğer mobil uygulamalara bağlanabilirse de, burada özellikle belirtilmedikçe, doğrudan veya dolaylı olarak herhangi bir bağlantılı mobil uygulama ile herhangi bir onay, ilişkilendirme, sponsorluk, onay veya bağlantı olduğunu ima etmiyoruz. İncelemekten veya değerlendirmekten sorumlu değiliz ve herhangi bir işletme veya kişinin tekliflerini veya mobil uygulamalarının içeriğini garanti etmiyoruz. Diğer üçüncü şahısların eylemleri, ürünleri, hizmetleri ve içeriği için herhangi bir sorumluluk veya yükümlülük kabul etmiyoruz. Bu Mobil Uygulamadan bir bağlantı yoluyla eriştiğiniz herhangi bir mobil uygulamanın yasal beyanlarını ve diğer kullanım koşullarını dikkatlice incelemelisiniz. Site dışı diğer mobil uygulamalara bağlanmanızın riski size aittir."),
            content("Yasaklanmış kullanımlar",
                "Sözleşmede belirtilen diğer şartlara ek olarak, Mobil Uygulamayı veya İçeriğini şu durumlarda kullanmanız yasaktır: (a) herhangi bir yasadışı amaç için; (b) başkalarını herhangi bir yasadışı eylemde bulunmaya veya bunlara katılmaya teşvik etmek; (c) herhangi bir uluslararası, federal, eyalet veya eyalet yönetmeliğini, kurallarını, yasalarını veya yerel yönetmelikleri ihlal etmek; (d) fikri mülkiyet haklarımızı veya başkalarının fikri mülkiyet haklarını ihlal etmek veya ihlal etmek; (e) taciz etmek, taciz etmek, hakaret etmek, zarar vermek, karalamak, iftira etmek, aşağılamak, sindirmek veya cinsiyet, cinsel yönelim, din, etnik köken, ırk, yaş, ulusal köken veya engelliliğe dayalı ayrımcılık yapmak; (f) yanlış veya yanıltıcı bilgi vermek; (g) Hizmetin veya herhangi bir ilgili mobil uygulamanın, diğer mobil uygulamaların veya İnternetin işlevselliğini veya çalışmasını etkileyecek herhangi bir şekilde kullanılacak veya kullanılabilecek virüsleri veya diğer kötü amaçlı kod türlerini yüklemek veya iletmek; (h) başkalarının kişisel bilgilerini toplamak veya takip etmek; (i) spam, kimlik avı, eczane, bahane, örümcek, tarama veya kazıma; (j) müstehcen veya ahlaka aykırı herhangi bir amaç için; veya (k) Hizmetin veya ilgili herhangi bir mobil uygulamanın, diğer mobil uygulamaların veya İnternetin güvenlik özelliklerine müdahale etmek veya bunlardan kaçınmak. Yasaklanmış kullanımlardan herhangi birini ihlal ettiğiniz için Hizmeti veya ilgili herhangi bir mobil uygulamayı kullanımınızı sona erdirme hakkımızı saklı tutuyoruz."),
            content("Fikri Mülkiyet Hakları",
                "Bu Sözleşme, size Mobil Uygulama Geliştiricisinin veya üçüncü tarafların sahip olduğu herhangi bir fikri mülkiyeti devretmez ve bu mülkle ilgili tüm haklar, unvanlar ve menfaatler (taraflar arasında olduğu gibi) yalnızca Mobil Uygulama Geliştiricisinde kalacaktır. Mobil Uygulama veya Hizmetlerimiz ile bağlantılı olarak kullanılan tüm ticari markalar, hizmet markaları, grafikler ve logolar, Mobil Uygulama Geliştiricisi veya Mobil Uygulama Geliştiricisi lisans verenlerinin ticari markaları veya tescilli ticari markalarıdır. Mobil Uygulamamız veya Hizmetlerimiz ile bağlantılı olarak kullanılan diğer ticari markalar, hizmet markaları, grafikler ve logolar diğer üçüncü tarafların ticari markaları olabilir. Mobil Uygulamamızı ve Hizmetlerimizi kullanmanız, size herhangi bir Mobil Uygulama Geliştiricisini veya üçüncü taraf ticari markalarını çoğaltma veya başka şekilde kullanma hakkı veya lisansı vermez."),
            content("Sorumluluğun sınırlandırılması",
                "Geçerli yasaların izin verdiği en geniş kapsamda, Mobil Uygulama Geliştiricisi, bağlı kuruluşları, memurları, yöneticileri, çalışanları, temsilcileri, tedarikçileri veya lisans verenleri hiçbir durumda herhangi bir kişiye karşı (a) aşağıdakilerden sorumlu olmayacaktır: herhangi bir dolaylı, arızi, özel, cezalandırıcı, herhangi bir sorumluluk teorisi altında ortaya çıkan zararlar (bunlarla sınırlı olmamak üzere, kar kaybı, gelir, satış, itibar, içerik kullanımı, iş üzerindeki etki, iş kesintisi, beklenen tasarruf kaybı, iş fırsatı kaybı dahil, ancak bunlarla sınırlı olmamak üzere) Sınırlama olmaksızın, sözleşme, haksız fiil, garanti, yasal görevin ihlali, ihmal veya başka türlü, Mobil Uygulama Geliştiricisine bu tür zararların olasılığı konusunda bilgi verilmiş veya bu tür zararları öngörmüş olsa bile. Geçerli yasaların izin verdiği azami ölçüde, Mobil Uygulama Geliştiricisinin ve bağlı kuruluşlarının, memurlarının, çalışanlarının, temsilcilerinin, tedarikçilerinin ve lisans verenlerinin hizmetlerle ilgili toplam sorumluluğu, bir dolardan fazla bir tutar veya fiilen ödenen herhangi bir tutarla sınırlı olacaktır. Bu tür bir yükümlülüğü doğuran ilk olay veya olaydan önceki bir aylık dönem için Mobil Uygulama Geliştiricisine yaptığınız nakit para. Sınırlamalar ve istisnalar, bu çözümün size herhangi bir kayıp veya temel amacına ulaşamaması için tam olarak tazminat vermemesi durumunda da geçerlidir."),
            content("Tazminat",
                "Mobil Uygulama Geliştiricisini ve bağlı kuruluşlarını, direktörlerini, görevlilerini, çalışanlarını ve aracılarını, makul avukatlık ücretleri dahil olmak üzere herhangi bir üçüncü kişiyle bağlantılı veya bunlardan kaynaklanan her türlü yükümlülük, kayıp, hasar veya maliyetten ve bunlara karşı tazmin etmeyi ve tutmayı kabul etmektesiniz. İçeriğiniz, Mobil Uygulama veya Hizmetleri kullanımınız veya sizin tarafınızdan yapılan herhangi bir kasıtlı suistimal nedeniyle veya bunlarla ilgili olarak bunlardan herhangi birine karşı ileri sürülen taraf iddiaları, iddiaları, eylemleri, anlaşmazlıkları veya talepleri."),
            content("Bölünebilirlik",
                "Bu Sözleşmede yer alan tüm haklar ve kısıtlamalar, yalnızca geçerli yasaları ihlal etmedikleri ve bu Sözleşmeyi yasa dışı, geçersiz kılmamaları için gerekli olduğu ölçüde sınırlandırıldıkları ölçüde kullanılabilir ve geçerli ve bağlayıcı olacaktır. veya uygulanamaz. Bu Sözleşmenin herhangi bir hükmünün veya herhangi bir hükmünün herhangi bir hükmünün yetkili bir mahkeme tarafından yasa dışı, geçersiz veya uygulanamaz olduğuna karar verilirse, tarafların niyeti, kalan hükümlerin veya bölümlerinin, işbu belgenin konusu ve kalan tüm hükümler veya kısımları tam olarak yürürlükte kalacaktır."),
            content("Tartışmalı karar",
                "Bu Sözleşmenin oluşturulması, yorumlanması ve uygulanması ve bundan kaynaklanan her türlü ihtilaf, ihtilaflara veya hukuk seçimine ilişkin kurallarına ve geçerli olduğu ölçüde yasalara bakılmaksızın TCK, Türkiye'nın maddi ve usul yasalarına tabi olacaktır. Türkiye. Konuyla ilgili davalar için münhasır yargı yetkisi ve mahkeme yeri TCK, Türkiye'da bulunan mahkemeler olacaktır ve bu vesileyle bu mahkemelerin kişisel yargı yetkisine başvurursunuz. İşbu Sözleşmeden doğan veya bu Sözleşmeyle ilgili herhangi bir işlemde jüri yargılaması hakkından feragat edersiniz. Uluslararası Mal Satış Sözleşmelerine İlişkin Birleşmiş Milletler Konvansiyonu bu Anlaşma için geçerli değildir."),
            content("Değişiklikler ve düzeltmeler",
                "Bu Sözleşmeyi veya Mobil Uygulama veya Hizmetlere ilişkin politikalarını herhangi bir zamanda, bu Sözleşmenin güncellenmiş bir versiyonunun Mobil Uygulamada yayınlanmasından itibaren geçerli olmak üzere değiştirme hakkını saklı tutarız. Bunu yaptığımızda, bu sayfanın altındaki güncellenmiş tarihi revize edeceğiz. Bu tür değişikliklerden sonra Mobil Uygulamayı kullanmaya devam etmeniz, bu tür değişikliklere rıza gösterdiğiniz anlamına gelecektir. Politika, Website politikaları ile oluşturulmuştur."),
            content("Bu şartların kabulü",
                "Bu Sözleşmeyi okuduğunuzu ve tüm hüküm ve koşullarını kabul ettiğinizi onaylıyorsunuz. Mobil Uygulamayı veya Hizmetlerini kullanarak, bu Sözleşmeye tabi olmayı kabul edersiniz. Bu Sözleşmenin şartlarına uymayı kabul etmiyorsanız, Mobil Uygulama ve Hizmetlerini kullanma veya bunlara erişme yetkiniz yoktur."),
            content("Bize Ulaşın",
                "Bu Sözleşme hakkında daha fazla bilgi almak için bizimle iletişime geçmek veya onunla ilgili herhangi bir konuda bizimle iletişime geçmek isterseniz, support@negotium.com adresine bir mail yazabilirsiniz. "),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 16.0, 16.0),
              child: Text(
                "Bu belge en son 27 Şubat 2021'de güncellenmiştir.",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ));
  }

  Widget content(String title, String content) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 16.0, 16.0),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}
