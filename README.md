# First Collection — Fabric Tracker

Poori app ready hy, database (Supabase) already live hy aur credentials
`index.html` ke andar hi hardcoded hain — koi setup screen nahi, koi config
paste nahi karni. Bas is file ko GitHub Pages pe daal do, link mil jayega.

## Naye features (is version mai)

- **Admin vs User links** — neeche dekho, do alag links hain
- **Fabric edit** — fabric ka naam/QR/opening stock badal sakte ho (sirf Admin)
- **Full history** — har fabric pe tap karo to uski poori entry history dikhti hy (na ke sirf "aaj ka" data)
- **Category dropdown** — Usage entry mai category select karo; naya category ek dafa type karo, uske baad hamesha dropdown mai milega
- **Season dropdown** — Summer / Winter / Spring-Fall / All-Season
- **Note field** — Usage aur Restock dono mai optional note likh sakte ho
- **Live sync** — koi bhi device entry kare, dusre device pe khud-ba-khud update ho jata hy, refresh karne ki zaroorat nahi

---

## GitHub Pages pe daalna (10 minute, sirf ek dafa)

1. **github.com** pe account banao (agar nahi hy)
2. Naya repository banao — naam de do `first-collection-factory`, "Public" rakho
3. Is folder ki files (`index.html`, `schema.sql`, `README.md`) us repo mai upload kar do
   (GitHub website pe "Add file → Upload files" se drag-drop kar ke ho jata hy)
4. Repo ke **Settings → Pages** mai jao
5. "Source" mai `main` branch select karo, Save dabao
6. 1-2 minute baad ek link milega jesa:
   `https://<your-username>.github.io/first-collection-factory/`

---

## Do links — Admin (tum) aur User (bhai)

**Admin link (sirf tum use karo):**
```
https://<your-username>.github.io/first-collection-factory/?key=jHDsqOk2x1Gf
```
Ye link ek dafa apne phone/laptop pe khol lo — us device pe hamesha ke liye
"Admin Mode" yaad rah jayega (dobara `?key=...` likhne ki zaroorat nahi).
Admin hi fabric ka naam/QR/opening stock edit kar sakta hy.

**User link (bhai ko ye do):**
```
https://<your-username>.github.io/first-collection-factory/
```
Bina `?key=...` ke — is link se sirf entries ki ja sakti hain (Usage/Restock),
edit ka option nahi dikhega. Header mai "User Mode" likha hoga.

> Ye ek simple security hy, poora login system nahi — chunke ye sirf 2 logon
> ke ghar/factory ke andar use hone wala tool hy, itna kaafi hy. Agar link kisi
> aur ko na do, admin access mehfooz rahega.

---

## Roz ka use

1. **Scan tab** → camera se QR scan karo (ya manually select karo)
2. Usage/Restock select karo, Design/Category/Season (Usage mai) ya sirf Note (Restock mai) daalo, kg dalo, Save
3. **Stock tab** → kisi bhi fabric pe tap karo to uski poori history aur (Admin ke liye) edit option khulta hy
4. **Add tab** → naya fabric add karo, QR turant milega
5. **QR Sheet tab** → sab QR ek sheet pe print karo

Sab kuch live hy — jo entry kisi bhi device se ho, dusre device pe turant dikh jayegi.

---

## Kharcha

- Supabase free tier + GitHub Pages free = **Rs. 0/month**
- Supabase free project 1 hafta bilkul use na ho to pause ho jata hy — dashboard se ek click mai resume ho jata hy
