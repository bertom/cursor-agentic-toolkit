# Team Kit v1 – Scope (Intent)

## Doel

Een gedeelde samenwerkinglaag creëren binnen een bestaande projectrepo, zodat een klein team (±3 developers) consistent kan samenwerken met gedeelde context, duidelijke validatiemomenten en minimale afhankelijkheid van individuele workflows of volledige automatisering.

De Team Kit moet samenwerking structureren zonder de natuurlijke ontwikkelworkflow te verstoren.

---

# 1. Samenwerking

## intent

Het team moet op een consistente manier kunnen samenwerken, ook wanneer teamleden verschillende werkstijlen hebben (meer of minder AI-gedreven).

## requirements

- teamleden werken vanuit gedeelde afspraken
- samenwerking is niet afhankelijk van één persoon
- samenwerking blijft mogelijk zonder AI tooling
- AI tooling mag werk versnellen maar niet afdwingen
- teamleden begrijpen wat verwacht wordt zonder uitgebreide uitleg
- de workflow ondersteunt zowel handmatige als AI-assisted stappen
- de samenwerking voelt natuurlijk voor developers
- de structuur helpt alignment behouden zonder bureaucratie

---

# 2. Gedeelde context

## intent

Alle relevante projectcontext moet expliciet beschikbaar zijn, zodat beslissingen niet alleen in hoofden of chats bestaan.

## requirements

- architectuurcontext is beschikbaar voor het team
- technische context is beschikbaar voor het team
- domeincontext is beschikbaar voor het team
- belangrijke constraints zijn zichtbaar
- terminologie is consistent binnen het project
- nieuwe teamleden kunnen projectcontext begrijpen zonder uitgebreide overdracht
- context kan evolueren tijdens het project
- contextwijzigingen zijn traceable

---

# 3. Workflow duidelijkheid

## intent

Het moet duidelijk zijn welke stappen bestaan in het ontwikkelproces en wanneer welke informatie nodig is.

## requirements

- het proces van idee tot implementatie is begrijpelijk
- teamleden weten wanneer een brief nodig is
- teamleden weten wanneer een spec nodig is
- teamleden weten wanneer een task nodig is
- teamleden weten wanneer documentatie moet worden bijgewerkt
- teamleden weten wanneer een wijziging impact heeft op bestaande functionaliteit
- het proces ondersteunt iteratief werken
- het proces is lichtgewicht
- het proces introduceert geen onnodige stappen

---

# 4. Validatie

## intent

Bij elke stap moet duidelijk zijn wat gecontroleerd moet worden, zodat interpretatieverschillen worden voorkomen.

## requirements

- het is duidelijk wat gevalideerd moet worden bij een featurebeschrijving
- het is duidelijk wat gevalideerd moet worden bij een spec
- het is duidelijk wat gevalideerd moet worden bij een task
- het is duidelijk wat gevalideerd moet worden bij implementatie
- het is duidelijk wat gevalideerd moet worden bij documentatie-updates
- validatie helpt om misinterpretatie te voorkomen
- validatie helpt om scope creep te voorkomen
- validatie helpt om consistentie te behouden
- validatie verhoogt kwaliteit zonder zware reviewprocessen

---

# 5. PR review

## intent

Wijzigingen worden gevalideerd door een andere developer om consistentie en gedeeld begrip te waarborgen.

## requirements

- wijzigingen worden gecontroleerd door minimaal één andere developer
- review omvat meer dan alleen codekwaliteit
- review valideert of intent correct is begrepen
- review valideert of gedrag overeenkomt met verwachting
- review valideert of scope duidelijk is gebleven
- review valideert of impact zichtbaar is
- review helpt impliciete aannames zichtbaar te maken
- review ondersteunt kennisdeling binnen het team
- review blijft lichtgewicht
- review mag ondersteund worden door AI maar niet vervangen

---

# 6. Traceability

## intent

Beslissingen en wijzigingen moeten herleidbaar zijn zodat het team begrijpt waarom iets bestaat.

## requirements

- wijzigingen zijn begrijpelijk zonder git diff analyse
- het is duidelijk waarom een wijziging is gedaan
- het is duidelijk welk probleem wordt opgelost
- het is duidelijk welke onderdelen geraakt zijn
- het is mogelijk om van wijziging terug te gaan naar intent
- relevante documentatie blijft aligned met de code
- kennis blijft behouden bij teamwisselingen
- wijzigingen in werkwijze zijn zichtbaar
- wijzigingen in context zijn zichtbaar

---

# 7. Documentatie als onderdeel van samenwerking

## intent

Documentatie ondersteunt samenwerking en blijft in lijn met de codebase.

## requirements

- documentatie helpt teamleden begrijpen wat gebouwd wordt
- documentatie helpt teamleden begrijpen waarom iets gebouwd wordt
- documentatie hoeft niet uitgebreid te zijn
- documentatie wordt bijgewerkt wanneer gedrag verandert
- documentatie ondersteunt overdraagbaarheid van werk
- documentatie voorkomt kennisverlies
- documentatie evolueert mee met het project
- documentatie maakt impliciete aannames expliciet

---

# 8. Human-first ontwerp

## intent

De Team Kit moet aansluiten bij hoe developers werken.

## requirements

- developers kunnen normaal blijven werken
- developers hoeven geen nieuwe methodologie te leren
- developers hoeven geen specifieke AI tooling te gebruiken
- structuur ondersteunt werk zonder te blokkeren
- structuur helpt maar stuurt niet overdreven
- structuur maakt samenwerking duidelijker
- structuur vermindert cognitieve belasting
- structuur voorkomt dat developers moeten raden wat verwacht wordt

---

# 9. Compatibiliteit met AI tooling

## intent

De Team Kit moet bruikbaar zijn met AI tooling zonder afhankelijk te worden van specifieke tools.

## requirements

- AI tooling kan helpen bij structureren van informatie
- AI tooling kan helpen bij validatie
- AI tooling kan helpen bij consistentie
- AI tooling kan helpen bij documentatie-updates
- workflow blijft bruikbaar zonder AI tooling
- workflow blijft begrijpelijk voor humans
- AI blijft ondersteunend aan samenwerking
- AI vervangt geen menselijke verantwoordelijkheid

---

# 10. Iteratieve adoptie

## intent

De Team Kit moet geleidelijk ingevoerd kunnen worden binnen een bestaand project.

## requirements

- bestaande codebase hoeft niet herstructureerd te worden
- bestaande workflow hoeft niet abrupt te veranderen
- team kan beginnen met kleine subset
- team kan leren terwijl het systeem evolueert
- structuur kan aangepast worden op basis van ervaring
- implementatie kan beginnen met één pilot feature
- team kan nieuwe onderdelen toevoegen wanneer nodig
- systeem hoeft niet volledig compleet te zijn bij start

---

# 11. Relatie met persoonlijke toolkit

## intent

De bestaande persoonlijke toolkit vormt de basis maar wordt aangepast voor samenwerking.

bron:
https://github.com/bertom/cursor-agentic-toolkit

## requirements

- persoonlijke workflow dient als uitgangspunt
- generieke onderdelen worden gedeeld met team
- persoonlijke voorkeuren worden niet verplicht voor anderen
- toolkit wordt vereenvoudigd waar nodig
- toolkit wordt aangepast op basis van teamgebruik
- toolkit ondersteunt meerdere werkstijlen
- toolkit helpt consistentie creëren
- toolkit blijft flexibel

---

# Samenvatting van de intent

De Team Kit moet:

- samenwerking structureren
- context expliciet maken
- validatie ondersteunen
- wijzigingen traceable maken
- onboarding eenvoudig maken
- AI ondersteuning mogelijk maken
- human-first blijven
- iteratief kunnen evolueren

zonder:

- zware processen
- verplichte automatisering
- complexe governance
- tool lock-in
- cognitieve overload
