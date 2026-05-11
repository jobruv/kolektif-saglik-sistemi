# kolektif-saglik-sistemi

HTML & CSS & JS ve Java (Spring Boot) kullanılarak gerçekleştirdiğimiz projemiz, maddi açıdan dezavantajlı grupların sağlıklı gıdaya erişimi için bir web çözümü sunmaktadır.

Kullanılan Teknolojiler
Frontend: HTML5, CSS3, JavaScript

Backend: Java, Spring Boot

Veritabanı: PostgreSQL

Paket Yöneticisi: Maven

Geliştirme Ortamı Gereksinimleri
Ekipteki tüm üyelerin projeyi sorunsuz çalıştırabilmesi için sistemlerinde aşağıdaki sürümlerin kurulu olması gerekmektedir:

Java Development Kit (JDK) 17 (veya kullanılan sürüm)

PostgreSQL Server 8.0+

Git

Backend için IntelliJ IDEA / Eclipse

Frontend için Visual Studio Code (Live Server eklentisi ile)

Kurulum ve Çalıştırma Adımları
1. Veritabanı Yapılandırması
Yerel PostgreSQL sunucunuzda proje için bir veritabanı oluşturun:

SQL
CREATE DATABASE food_access_db;
2. Projeyi Klonlama
Bash
git clone https://github.com/KULLANICI_ADI/PROJE_ADI.git
cd PROJE_ADI
3. Backend (Spring Boot) Ortamının Kurulması
IDE üzerinden Spring Boot projesini (genellikle backend klasörü) açın.

src/main/resources/application.properties (veya .yml) dosyasındaki veritabanı bağlantı bilgilerini kendi yerel MySQL bilgilerinize göre güncelleyin:

Properties
spring.datasource.url=jdbc:postgresql://localhost:3306/example_db
spring.datasource.username=VERITABANI_KULLANICI_ADINIZ
spring.datasource.password=VERITABANI_SIFRENIZ
spring.jpa.hibernate.ddl-auto=update
Maven bağımlılıklarını indirin:

Bash
   mvn clean install
Uygulamayı IDE üzerinden veya komut satırından çalıştırın:

Bash
   mvn spring-boot:run
Uygulama varsayılan olarak http://localhost:8080 adresinde ayağa kalkacaktır.

4. Frontend Ortamının Kurulması
frontend klasörünü Visual Studio Code ile açın.

Statik dosyaları çalıştırmak için index.html dosyasına sağ tıklayıp "Open with Live Server" seçeneğini kullanın.

JavaScript dosyalarındaki API istek URL'lerinin (fetch/axios) http://localhost:8080 adresine (veya belirlediğiniz backend portuna) yönlendirildiğinden emin olun.
Not: Frontend ve Backend farklı portlarda çalışacağı için Spring Boot tarafında @CrossOrigin notasyonu veya global bir CORS yapılandırması eklenmiş olmalıdır.
