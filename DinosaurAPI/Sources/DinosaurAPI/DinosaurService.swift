//
//  DinosaurService.swift
//  
//
//  Created by Tiger Nixon on 4/7/23.
//

import Foundation
import UIKit

public actor DinosaurService {
    
    public init() {
        print("DinosaurService ==> Created")
    }
    
    deinit {
        print("DinosaurService ==> Destroyed")
    }
    
    func loadImage(fileName: String, fileExtension: String = "png") -> UIImage {
        if let image = UIImage(named: "\(fileName).\(fileExtension)", in: Bundle.module, with: .none) {
            return image
        }
        return UIImage()
    }
    
    func simulateLatency() async {
        try? await Task.sleep(nanoseconds: UInt64.random(in: 250_000_000...500_000_000))
        try? await Task.sleep(nanoseconds: UInt64.random(in: 250_000_000...500_000_000))
        try? await Task.sleep(nanoseconds: UInt64.random(in: 250_000_000...500_000_000))
    }
    
    public func dinosaurs() async -> [Dinosaur] {
        
        await simulateLatency()
        
        var result = [Dinosaur]()
        
        result.append(tyrannosaurus)
        result.append(triceratops)
        result.append(brachiosaurus)
        result.append(stegosaurus)
        result.append(coelophysis)
        result.append(plateosaurus)
        
        return result
    }
    
    public func details(dinosaur: Dinosaur) async -> DinosaurDetails {
        
        await simulateLatency()
        
        if dinosaur.id == tyrannosaurus.id { return tyrannosaurusDetails }
        else if dinosaur.id == triceratops.id { return triceratopsDetails }
        else if dinosaur.id == brachiosaurus.id { return brachiosaurusDetails }
        else if dinosaur.id == stegosaurus.id { return stegosaurusDetails }
        else if dinosaur.id == coelophysis.id { return coelophysisDetails }
        else  { return plateosaurusDetails }
    }
    
    public func details(period: Period) async -> PeriodDetails {
        
        await simulateLatency()
        
        if period.id == triassicPeriod.id { return triassicDetails }
        else if period.id == jurassicPeriod.id { return jurassicDetails }
        else  { return cretaciousDetails }
    }
    
    lazy var mesozoicEra: Era = {
        Era(id: 0, name: "Mesozoic")
    }()
    
    lazy var triassicPeriod: Period = {
        Period(id: 0, name: "Triassic", era: mesozoicEra)
    }()
    
    lazy var triassicDetails: PeriodDetails = {
        
        let image = loadImage(fileName: "triassic_image")
        
        let p1 = "The Triassic is a geologic period and system which spans 50.6 million years from the end of the Permian Period 251.902 million years ago (Mya), to the beginning of the Jurassic Period 201.36 Mya. The Triassic is the first and shortest period of the Mesozoic Era. Both the start and end of the period are marked by major extinction events. The Triassic Period is subdivided into three epochs: Early Triassic, Middle Triassic and Late Triassic."
        
        let p2 = "The Triassic began in the wake of the Permian–Triassic extinction event, which left the Earth's biosphere impoverished; it was well into the middle of the Triassic before life recovered its former diversity. Three categories of organisms can be distinguished in the Triassic record: survivors from the extinction event, new groups that flourished briefly, and other new groups that went on to dominate the Mesozoic Era. Reptiles, especially archosaurs, were the chief terrestrial vertebrates during this time. A specialized subgroup of archosaurs, called dinosaurs, first appeared in the Late Triassic but did not become dominant until the succeeding Jurassic Period. Archosaurs that became dominant in this period were primarily pseudosuchians, ancestors of modern crocodilians, while some archosaurs specialized in flight, the first time among vertebrates, becoming the pterosaurs."
        
        let p3 = "Therapsids, the dominant vertebrates of the preceding Permian period, declined throughout the period. The first true mammals, themselves a specialized subgroup of therapsids, also evolved during this period. The vast supercontinent of Pangaea existed until the mid-Triassic, after which it began to gradually rift into two separate landmasses, Laurasia to the north and Gondwana to the south."
        
        let p4 = "The global climate during the Triassic was mostly hot and dry, with deserts spanning much of Pangaea's interior. However, the climate shifted and became more humid as Pangaea began to drift apart. The end of the period was marked by yet another major mass extinction, the Triassic–Jurassic extinction event, that wiped out many groups, including most pseudosuchians, and allowed dinosaurs to assume dominance in the Jurassic."
        
        var paragraphs = [PeriodDetails.Paragraph]()
        
        paragraphs.append(PeriodDetails.Paragraph(id: 0, text: p1))
        paragraphs.append(PeriodDetails.Paragraph(id: 1, text: p2))
        paragraphs.append(PeriodDetails.Paragraph(id: 2, text: p3))
        paragraphs.append(PeriodDetails.Paragraph(id: 3, text: p4))
        
        return PeriodDetails(id: triassicPeriod.id, image: image, paragraphs: paragraphs, dinosaurs: [coelophysis, plateosaurus])
    }()
    
    lazy var jurassicPeriod: Period = {
        Period(id: 1, name: "Jurassic", era: mesozoicEra)
    }()
    
    lazy var jurassicDetails: PeriodDetails = {
        
        let image = loadImage(fileName: "jurassic_image")
        
        let p1 = "The Jurassic is a geologic period and stratigraphic system that spanned from the end of the Triassic Period 201.4 million years ago (Mya) to the beginning of the Cretaceous Period, approximately 145 Mya. The Jurassic constitutes the middle period of the Mesozoic Era and is named after the Jura Mountains, where limestone strata from the period were first identified."
        
        let p2 = "The start of the Jurassic was marked by the major Triassic–Jurassic extinction event, associated with the eruption of the Central Atlantic Magmatic Province. The beginning of the Toarcian Stage started around 183 million years ago and is marked by the Toarcian Oceanic Anoxic Event, a global episode of oceanic anoxia, ocean acidification, and elevated temperatures associated with extinctions, likely caused by the eruption of the Karoo-Ferrar large igneous provinces. The end of the Jurassic, however, has no clear boundary with the Cretaceous and is the only boundary between geological periods to remain formally undefined."
        
        let p3 = "By the beginning of the Jurassic, the supercontinent Pangaea had begun rifting into two landmasses: Laurasia to the north and Gondwana to the south. The climate of the Jurassic was warmer than the present, and there were no ice caps. Forests grew close to the poles, with large arid expanses in the lower latitudes."
        
        let p4 = "On land, the fauna transitioned from the Triassic fauna, dominated jointly by dinosauromorph and pseudosuchian archosaurs, to one dominated by dinosaurs alone. The first birds appeared during the Jurassic, evolving from a branch of theropod dinosaurs. Other major events include the appearance of the earliest lizards and the evolution of therian mammals. Crocodylomorphs made the transition from a terrestrial to an aquatic life. The oceans were inhabited by marine reptiles such as ichthyosaurs and plesiosaurs, while pterosaurs were the dominant flying vertebrates. The first sharks, rays and crabs also first appeared during the period."
        
        var paragraphs = [PeriodDetails.Paragraph]()
        
        paragraphs.append(PeriodDetails.Paragraph(id: 0, text: p1))
        paragraphs.append(PeriodDetails.Paragraph(id: 1, text: p2))
        paragraphs.append(PeriodDetails.Paragraph(id: 2, text: p3))
        paragraphs.append(PeriodDetails.Paragraph(id: 3, text: p4))
        
        return PeriodDetails(id: jurassicPeriod.id, image: image, paragraphs: paragraphs, dinosaurs: [stegosaurus, brachiosaurus])
    }()
    
    lazy var cretaciousPeriod: Period = {
        Period(id: 2, name: "Cretacious", era: mesozoicEra)
    }()
    
    lazy var cretaciousDetails: PeriodDetails = {
        
        let image = loadImage(fileName: "cretacious_image")
        
        let p1 = "The Cretaceous is a geological period that lasted from about 145 to 66 million years ago (Mya). It is the third and final period of the Mesozoic Era, as well as the longest. At around 79 million years, it is the longest geological period of the entire Phanerozoic. The name is derived from the Latin creta, \"chalk\", which is abundant in the latter half of the period. It is usually abbreviated K, for its German translation Kreide."
        
        let p2 = "The Cretaceous was a period with a relatively warm climate, resulting in high eustatic sea levels that created numerous shallow inland seas. These oceans and seas were populated with now-extinct marine reptiles, ammonites, and rudists, while dinosaurs continued to dominate on land. The world was ice free, and forests extended to the poles. During this time, new groups of mammals and birds appeared. During the Early Cretaceous, flowering plants appeared and began to rapidly diversify, becoming the dominant group of plants across the Earth by the end of the Cretaceous, coincident with the decline and extinction of previously widespread gymnosperm groups."
        
        let p3 = "The Cretaceous (along with the Mesozoic) ended with the Cretaceous–Paleogene extinction event, a large mass extinction in which many groups, including non-avian dinosaurs, pterosaurs, and large marine reptiles, died out. The end of the Cretaceous is defined by the abrupt Cretaceous–Paleogene boundary (K–Pg boundary), a geologic signature associated with the mass extinction that lies between the Mesozoic and Cenozoic Eras."
        
        let p4 = "The Cretaceous as a separate period was first defined by Belgian geologist Jean d'Omalius d'Halloy in 1822 as the Terrain Crétacé, using strata in the Paris Basin and named for the extensive beds of chalk (calcium carbonate deposited by the shells of marine invertebrates, principally coccoliths), found in the upper Cretaceous of Western Europe. The name Cretaceous was derived from Latin creta, meaning chalk. The twofold division of the Cretaceous was implemented by Conybeare and Phillips in 1822. Alcide d'Orbigny in 1840 divided the French Cretaceous into five étages (stages): the Neocomian, Aptian, Albian, Turonian, and Senonian, later adding the Urgonian between Neocomian and Aptian and the Cenomanian between the Albian and Turonian."
        
        var paragraphs = [PeriodDetails.Paragraph]()
        
        paragraphs.append(PeriodDetails.Paragraph(id: 0, text: p1))
        paragraphs.append(PeriodDetails.Paragraph(id: 1, text: p2))
        paragraphs.append(PeriodDetails.Paragraph(id: 2, text: p3))
        paragraphs.append(PeriodDetails.Paragraph(id: 3, text: p4))
        
        return PeriodDetails(id: cretaciousPeriod.id, image: image, paragraphs: paragraphs, dinosaurs: [tyrannosaurus, triceratops])
    }()
    
    lazy var tyrannosaurus: Dinosaur = {
        let thumb = loadImage(fileName: "tyrannosaurus_thumb")
        return Dinosaur(id: 0,
                        name: "Tyrannosaurus Rex",
                        meaning: "Tyrant Lizard King",
                        thumb: thumb)
    }()
    
    lazy var tyrannosaurusDetails: DinosaurDetails = {
        
        let image = loadImage(fileName: "tyrannosaurus_image")
        
        let p1 = "Tyrannosaurus is a genus of large theropod dinosaur. The species Tyrannosaurus rex (rex meaning \"kin\" in Latin), often called T. rex or colloquially T-Rex, is one of the best represented theropods. It lived throughout what is now western North America, on what was then an island continent known as Laramidia. Tyrannosaurus had a much wider range than other tyrannosaurids. Fossils are found in a variety of rock formations dating to the Maastrichtian age of the Upper Cretaceous period, 68 to 66 million years ago. It was the last known member of the tyrannosaurids and among the last non-avian dinosaurs to exist before the Cretaceous–Paleogene extinction event."
        
        let p2 = "Like other tyrannosaurids, Tyrannosaurus was a bipedal carnivore with a massive skull balanced by a long, heavy tail. Relative to its large and powerful hind limbs, the forelimbs of Tyrannosaurus were short but unusually powerful for their size, and they had two clawed digits. The most complete specimen measures up to 12.3–12.4 m (40.4–40.7 ft) in length; however, according to most modern estimates, T. rex could grow to lengths of over 12.4 m (40.7 ft), up to 3.66–3.96 m (12–13 ft) tall at the hips, and 8.87 metric tons (9.78 short tons) in body mass. Although other theropods rivaled or exceeded Tyrannosaurus rex in size, it is still among the largest known land predators and is estimated to have exerted the strongest bite force among all terrestrial animals. By far the largest carnivore in its environment, Tyrannosaurus rex was most likely an apex predator, preying upon hadrosaurs, juvenile armored herbivores like ceratopsians and ankylosaurs, and possibly sauropods. Some experts have suggested the dinosaur was primarily a scavenger. The question of whether Tyrannosaurus was an apex predator or a pure scavenger was among the longest debates in paleontology. Most paleontologists today accept that Tyrannosaurus was both an active predator and a scavenger."
        
        let p3 = "Specimens of Tyrannosaurus rex include some that are nearly complete skeletons. Soft tissue and proteins have been reported in at least one of these specimens. The abundance of fossil material has allowed significant research into many aspects of its biology, including its life history and biomechanics. The feeding habits, physiology, and potential speed of Tyrannosaurus rex are a few subjects of debate. Its taxonomy is also controversial, as some scientists consider Tarbosaurus bataar from Asia to be a second Tyrannosaurus species, while others maintain Tarbosaurus is a separate genus. Several other genera of North American tyrannosaurids have also been synonymized with Tyrannosaurus."
        
        let p4 = "As the archetypal theropod, Tyrannosaurus has been one of the best-known dinosaurs since the early 20th century and has been featured in film, advertising, postal stamps, and many other media."
        
        var paragraphs = [DinosaurDetails.Paragraph]()
        
        paragraphs.append(DinosaurDetails.Paragraph(id: 0, text: p1))
        paragraphs.append(DinosaurDetails.Paragraph(id: 1, text: p2))
        paragraphs.append(DinosaurDetails.Paragraph(id: 2, text: p3))
        paragraphs.append(DinosaurDetails.Paragraph(id: 3, text: p4))
        
        return DinosaurDetails(id: tyrannosaurus.id, image: image, paragraphs: paragraphs, period: cretaciousPeriod)
    }()
    
    
    lazy var triceratops: Dinosaur = {
        let thumb = loadImage(fileName: "triceratops_thumb")
        return Dinosaur(id: 1,
                        name: "Triceratops",
                        meaning: "Three-Horned Face",
                        thumb: thumb)
    }()
    
    lazy var triceratopsDetails: DinosaurDetails = {
        
        let image = loadImage(fileName: "triceratops_image")
        
        let p1 = "Triceratops is a genus of herbivorous chasmosaurine ceratopsid dinosaur that first appeared during the late Maastrichtian stage of the Late Cretaceous period, about 68 million years ago in what is now North America. It is one of the last-known non-avian dinosaur genera, and became extinct in the Cretaceous–Paleogene extinction event 66 million years ago. The name Triceratops, which literally means 'three-horned face', is derived from the Greek words trí- (τρί-) meaning 'three', kéras (κέρας) meaning 'horn', and ṓps (ὤψ) meaning 'face'."
        
        let p2 = "Bearing a large bony frill, three horns on the skull, and a large four-legged body, exhibiting convergent evolution with bovines and rhinoceroses, Triceratops is one of the most recognizable of all dinosaurs and the most well-known ceratopsid. It was also one of the largest, up to 8–9 metres (26–30 ft) long and 5–9 metric tons (5.5–9.9 short tons) in body mass. It shared the landscape with and was most likely preyed upon by Tyrannosaurus, though it is less certain that two adults did battle in the fanciful manner often depicted in museum displays and popular images. The functions of the frills and three distinctive facial horns on its head have long inspired debate. Traditionally, these have been viewed as defensive weapons against predators. More recent interpretations find it probable that these features were primarily used in species identification, courtship, and dominance display, much like the antlers and horns of modern ungulates."
        
        let p3 = "Triceratops was traditionally placed within the \"short-frilled\" ceratopsids, but modern cladistic studies show it to be a member of the Chasmosaurinae which usually have long frills. Two species, T. horridus and T. prorsus, are considered valid today, from the seventeen species that have ever been named. Research published in 2010 concluded that the contemporaneous Torosaurus, a ceratopsid long regarded as a separate genus, represents Triceratops in its mature form. This view has been disputed; further data is needed to settle the debate."
        
        let p4 = "Triceratops has been documented by numerous remains collected since the genus was first described in 1889 by American paleontologist Othniel Charles Marsh. Specimens representing life stages from hatchling to adult have been found. As the archetypal ceratopsid, Triceratops is one of the most popular dinosaurs, and has been featured in film, postal stamps, and many other types of media"
        
        var paragraphs = [DinosaurDetails.Paragraph]()
        
        paragraphs.append(DinosaurDetails.Paragraph(id: 0, text: p1))
        paragraphs.append(DinosaurDetails.Paragraph(id: 1, text: p2))
        paragraphs.append(DinosaurDetails.Paragraph(id: 2, text: p3))
        paragraphs.append(DinosaurDetails.Paragraph(id: 3, text: p4))
        
        return DinosaurDetails(id: triceratops.id, image: image, paragraphs: paragraphs, period: cretaciousPeriod)
    }()
    
    lazy var brachiosaurus: Dinosaur = {
        let thumb = loadImage(fileName: "brachiosaurus_thumb")
        return Dinosaur(id: 2,
                        name: "Brachiosaurus Altithorax",
                        meaning: "Deep Chested Arm Lizard",
                        thumb: thumb)
    }()
    
    lazy var brachiosaurusDetails: DinosaurDetails = {
        
        let image = loadImage(fileName: "brachiosaurus_image")
        
        let p1 = "Brachiosaurus is a genus of sauropod dinosaur that lived in North America during the Late Jurassic, about 154 to 150 million years ago. It was first described by American paleontologist Elmer S. Riggs in 1903 from fossils found in the Colorado River valley in western Colorado, United States. Riggs named the dinosaur Brachiosaurus altithorax; the generic name is Greek for \"arm lizard\", in reference to its proportionately long arms, and the specific name means \"deep chest\". Brachiosaurus is estimated to have been between 18 and 22 meters (59 and 72 ft) long; body mass estimates of the subadult holotype specimen range from 28.3 to 46.9 metric tons (31.2 and 51.7 short tons). It had a disproportionately long neck, small skull, and large overall size, all of which are typical for sauropods. Atypically, Brachiosaurus had longer forelimbs than hindlimbs, which resulted in a steeply inclined trunk, and a proportionally shorter tail."
        
        let p2 = "Brachiosaurus is the namesake genus of the family Brachiosauridae, which includes a handful of other similar sauropods. Most popular depictions of Brachiosaurus are in fact based on Giraffatitan, a genus of brachiosaurid dinosaur from the Tendaguru Formation of Tanzania. Giraffatitan was originally described by German paleontologist Werner Janensch in 1914 as a species of Brachiosaurus, B. brancai, but moved to its own genus in 2009. Three other species of Brachiosaurus have been named based on fossils found in Africa and Europe; two are no longer considered valid, and a third has become a separate genus, Lusotitan."
        
        let p3 = "The type specimen of B. altithorax is still the most complete specimen, and only a few other specimens are thought to belong to the genus, making it one of the rarer sauropods of the Morrison Formation. It is regarded as a high browser, possibly cropping or nipping vegetation as high as 9 meters (30 ft) off the ground. Unlike other sauropods, it was unsuited for rearing on its hindlimbs. It has been used as an example of a dinosaur that was most likely ectothermic because of its large size and the corresponding need for sufficient forage, but more recent research suggests it was warm-blooded. Among the most iconic and initially thought to be one of the largest dinosaurs, Brachiosaurus has appeared in popular culture, notably in the 1993 film Jurassic Park."
        
        var paragraphs = [DinosaurDetails.Paragraph]()
        
        paragraphs.append(DinosaurDetails.Paragraph(id: 0, text: p1))
        paragraphs.append(DinosaurDetails.Paragraph(id: 1, text: p2))
        paragraphs.append(DinosaurDetails.Paragraph(id: 2, text: p3))
        
        return DinosaurDetails(id: brachiosaurus.id, image: image, paragraphs: paragraphs, period: cretaciousPeriod)
    }()
    
    lazy var stegosaurus: Dinosaur = {
        let thumb = loadImage(fileName: "stegosaurus_thumb")
        return Dinosaur(id: 3,
                        name: "Stegosaurus Stenops",
                        meaning: "Narrow-Faced Roof Lizard",
                        thumb: thumb)
    }()
    
    lazy var stegosaurusDetails: DinosaurDetails = {
        
        let image = loadImage(fileName: "stegosaurus_image")
        
        let p1 = "Stegosaurus is a genus of herbivorous, four-legged, armored dinosaur from the Late Jurassic, characterized by the distinctive kite-shaped upright plates along their backs and spikes on their tails. Fossils of the genus have been found in the western United States and in Portugal, where they are found in Kimmeridgian- to Tithonian-aged strata, dating to between 155 and 145 million years ago. Of the species that have been classified in the upper Morrison Formation of the western US, only three are universally recognized: S. stenops, S. ungulatus and S. sulcatus. The remains of over 80 individual animals of this genus have been found. Stegosaurus would have lived alongside dinosaurs such as Apatosaurus, Diplodocus, Camarasaurus and Allosaurus, the latter of which may have preyed on it."
        
        let p2 = "They were large, heavily built, herbivorous quadrupeds with rounded backs, short fore limbs, long hind limbs, and tails held high in the air. Due to their distinctive combination of broad, upright plates and tail tipped with spikes, Stegosaurus is one of the most recognizable kinds of dinosaurs. The function of this array of plates and spikes has been the subject of much speculation among scientists. Today, it is generally agreed that their spiked tails were most likely used for defense against predators, while their plates may have been used primarily for display, and secondarily for thermoregulatory functions. Stegosaurus had a relatively low brain-to-body mass ratio. It had a short neck and a small head, meaning it most likely ate low-lying bushes and shrubs. One species, Stegosaurus ungulatus, is one of the largest known of all the stegosaurians, reaching 7 metres (23 ft) in length and 3.8 metric tons (4.2 short tons) in body mass, and some specimens indicate an even larger body size."
        
        let p3 = "Stegosaurus remains were first identified during the \"Bone Wars\" by Othniel Charles Marsh at Dinosaur Ridge National Landmark. The first known skeletons were fragmentary and the bones were scattered, and it would be many years before the true appearance of these animals, including their posture and plate arrangement, became well understood. Despite its popularity in books and film, mounted skeletons of Stegosaurus did not become a staple of major natural history museums until the mid-20th century, and many museums have had to assemble composite displays from several different specimens due to a lack of complete skeletons. Stegosaurus is one of the better-known dinosaurs and has been featured in film, on postal stamps, and in many other types of media."
        
        var paragraphs = [DinosaurDetails.Paragraph]()
        
        paragraphs.append(DinosaurDetails.Paragraph(id: 0, text: p1))
        paragraphs.append(DinosaurDetails.Paragraph(id: 1, text: p2))
        paragraphs.append(DinosaurDetails.Paragraph(id: 2, text: p3))
        
        return DinosaurDetails(id: stegosaurus.id, image: image, paragraphs: paragraphs, period: cretaciousPeriod)
    }()
    
    lazy var coelophysis: Dinosaur = {
        let thumb = loadImage(fileName: "coelophysis_thumb")
        return Dinosaur(id: 4,
                        name: "Coelophysis",
                        meaning: "Hollow Form",
                        thumb: thumb)
    }()
    
    lazy var coelophysisDetails: DinosaurDetails = {
        
        let image = loadImage(fileName: "coelophysis_image")
        
        let p1 = "Coelophysis is an extinct genus of coelophysid theropod dinosaur that lived approximately 228 to 201.3 million years ago during the latter part of the Triassic Period from the Carnian and Rhaetian faunal stages in what is now the southwestern United States. Megapnosaurus was once considered a species within this genus, but this interpretation has been challenged since 2017 and the genus Megapnosaurus is now considered valid."
        
        let p2 = "Coelophysis was a small, slenderly-built, ground-dwelling, bipedal carnivore that could grow up to 3 m (9.8 ft) long. It is one of the earliest known dinosaur genera. Scattered material representing similar animals has been found worldwide in some Late Triassic and Early Jurassic formations."
        
        let p3 = "The type species C. bauri, originally given to the genus Coelurus by Edward Drinker Cope in 1887, was described by the latter in 1889. The names Longosaurus and Rioarribasaurus are synonymous with Coelophysis. Coelophysis is one of the most specimen-rich dinosaur genera."
        
        var paragraphs = [DinosaurDetails.Paragraph]()
        
        paragraphs.append(DinosaurDetails.Paragraph(id: 0, text: p1))
        paragraphs.append(DinosaurDetails.Paragraph(id: 1, text: p2))
        paragraphs.append(DinosaurDetails.Paragraph(id: 2, text: p3))
        
        return DinosaurDetails(id: coelophysis.id, image: image, paragraphs: paragraphs, period: cretaciousPeriod)
    }()
    
    lazy var plateosaurus: Dinosaur = {
        let thumb = loadImage(fileName: "plateosaurus_thumb")
        return Dinosaur(id: 5,
                        name: "Plateosaurus",
                        meaning: "Broad Lizard / Flat Lizard",
                        thumb: thumb)
    }()
    
    lazy var plateosaurusDetails: DinosaurDetails = {
        
        let image = loadImage(fileName: "plateosaurus_image")
        
        let p1 = "Plateosaurus (probably meaning \"broad lizard\", often mistranslated as \"flat lizard\") is a genus of plateosaurid dinosaur that lived during the Late Triassic period, around 214 to 204 million years ago, in what is now Central and Northern Europe. Plateosaurus is a basal (early) sauropodomorph dinosaur, a so-called \"prosauropod\". The type species is Plateosaurus trossingensis; before 2019, that honor was given to Plateosaurus engelhardti, but it was ruled as undiagnostic (i.e. indistinguishable from other dinosaurs) by the ICZN. Currently, there are three valid species; in addition to P. trossingensis, P. longiceps and P. gracilis are also known. However, others have been assigned in the past, and there is no broad consensus on the species taxonomy of plateosaurid dinosaurs. Similarly, there are a plethora of synonyms (invalid duplicate names) at the genus level."
        
        let p2 = "Discovered in 1834 by Johann Friedrich Engelhardt and described three years later by Hermann von Meyer, Plateosaurus was the fifth named dinosaur genus that is still considered valid. Although it had been described before Richard Owen formally named Dinosauria in 1842, it was not one of the three genera used by Owen to define the group, because at the time, it was poorly known and difficult to identify as a dinosaur. It is now among the dinosaurs best known to science: over 100 skeletons have been found, some of them nearly complete. The abundance of its fossils in Swabia, Germany, has led to the nickname Schwäbischer Lindwurm (Swabian lindworm)."
        
        let p3 = "Plateosaurus was a bipedal herbivore with a small skull on a long, flexible neck, sharp but plump plant-crushing teeth, powerful hind limbs, short but muscular arms and grasping hands with large claws on three fingers, possibly used for defence and feeding. Unusually for a dinosaur, Plateosaurus showed strong developmental plasticity: instead of having a fairly uniform adult size, fully grown individuals were between 4.8 and 10 metres (16 and 33 ft) long and weighed between 600 and 4,000 kilograms (1,300 and 8,800 lb). Commonly, the animals lived for at least 12 to 20 years, but the maximum life span is not known."
        
        let p4 = "Despite the great quantity and excellent quality of the fossil material, Plateosaurus was for a long time one of the most misunderstood dinosaurs. Some researchers proposed theories that were later shown to conflict with geological and palaeontological evidence, but have become the paradigm of public opinion. Since 1980 the taxonomy (relationships), taphonomy (how the animals became embedded and fossilised), biomechanics (how their skeletons worked), and palaeobiology (life circumstances) of Plateosaurus have been re-studied in detail, altering the interpretation of the animal's biology, posture and behaviour."
        
        var paragraphs = [DinosaurDetails.Paragraph]()
        
        paragraphs.append(DinosaurDetails.Paragraph(id: 0, text: p1))
        paragraphs.append(DinosaurDetails.Paragraph(id: 1, text: p2))
        paragraphs.append(DinosaurDetails.Paragraph(id: 2, text: p3))
        paragraphs.append(DinosaurDetails.Paragraph(id: 3, text: p4))
        
        return DinosaurDetails(id: plateosaurus.id, image: image, paragraphs: paragraphs, period: cretaciousPeriod)
    }()
    
}
