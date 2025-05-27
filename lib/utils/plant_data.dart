List<Map<String, String>> data = [
  // Apple Scab
  {
    'info':
        'Apple scab is a widespread fungal disease caused by Venturia inaequalis, primarily affecting apple and crabapple trees. It thrives in cool, wet climates and first appears in spring when the fungus overwinters in fallen leaves and releases spores that infect young leaves and fruit. The disease is characterized by olive-green to black, velvety spots on leaves and fruit. Over time, these lesions can cause leaf curling, premature defoliation, and fruit deformities or cracking, which significantly reduce the commercial value and overall health of the tree.',
    'treatment':
        'Managing apple scab typically involves a combination of fungicide applications, cultural practices, and sanitation. Protective fungicides like captan or mancozeb are applied before symptoms appear, especially during spring when new growth is most vulnerable. Systemic fungicides such as myclobutanil or propiconazole are effective during the infection period and should be rotated to prevent resistance. Pruning trees to increase airflow and reduce moisture buildup in the canopy also helps limit fungal spread. Additionally, thorough removal of fallen leaves and infected fruit from the orchard floor reduces the amount of overwintering fungal material that can spark new infections.',
    'prevention':
        'Preventing apple scab begins with planting resistant apple varieties such as ‘Liberty’, ‘Enterprise’, or ‘GoldRush’, which are bred to withstand the fungus. Maintaining proper orchard hygiene by regularly removing fallen leaves, pruning for air circulation, and avoiding overhead watering can drastically reduce the risk of infection. Applying urea in late autumn to hasten leaf decomposition and using disease forecasting tools like the Mills Table to time fungicide applications more precisely also form part of a comprehensive prevention strategy. Together, these practices form an effective integrated pest management (IPM) approach that minimizes reliance on chemicals while protecting the health and productivity of apple trees.',
  },
  // Apple Black Rot
  {
    'info':
        'Apple black rot is a fungal disease caused by Botryosphaeria obtusa, which affects not only the fruit but also the leaves, bark, and wood of apple trees. The disease is known for producing three types of symptoms: fruit rot (commonly called "frog-eye" rot), leaf spot, and limb cankers. On fruit, the disease starts as small, purple specks that enlarge into dark, sunken, circular lesions. The centers of these lesions may become light brown with concentric rings, resembling a bullseye. On leaves, it causes circular, brown spots with purple borders, and on twigs and limbs, it produces cankers that can girdle and kill branches. The fungus overwinters in dead wood, cankers, and mummified fruit, making proper sanitation critical.',
    'treatment':
        "Treatment of apple black rot focuses on a mix of chemical and cultural methods. Fungicide sprays, especially those containing captan, thiophanate-methyl, or myclobutanil, are effective when applied during the growing season—particularly from petal fall through summer. Pruning out infected branches and removing cankered wood is crucial for minimizing the sources of inoculum. It's important to make cuts well below the visible canker margins and during dry weather to reduce the risk of further spread. Additionally, any mummified fruit or fallen debris should be removed from the ground and destroyed to prevent the fungus from overwintering and restarting the infection cycle.",
    'prevention':
        "Preventing apple black rot involves maintaining a healthy orchard environment through proper sanitation, pruning, and tree care. Regularly inspect trees and promptly remove any dead or diseased wood, as this is a major source of infection. Avoid tree stress by providing adequate water and nutrients, as weakened trees are more susceptible to infection. Select planting sites with good air circulation and sunlight exposure to help foliage dry quickly after rain. Using disease-resistant cultivars and applying fungicides preventatively, especially after hailstorms or mechanical damage (which can serve as entry points for the fungus), can greatly reduce the risk of black rot outbreaks. Maintaining overall orchard hygiene is key to long-term prevention.",
  },
  // Cedar Apple Rust
  {
    'info':
        "Cedar apple rust is a fungal disease caused by Gymnosporangium juniperi-virginianae, which affects both apple (or crabapple) trees and certain species of juniper, particularly Eastern red cedar. This disease requires both hosts to complete its life cycle. In spring, bright orange, gelatinous galls appear on infected cedar trees, releasing spores that infect nearby apple trees. In apples, the disease presents as yellow-orange spots on leaves, which later develop black dots (spermagonia) and, on the undersides, spore-producing structures (aecia). If the infection is severe, it can cause premature defoliation and blemished or deformed fruit, though it rarely kills the tree outright.",
    'treatment':
        "Treatment of cedar apple rust involves targeted fungicide use and host management. Fungicides such as myclobutanil, propiconazole, or mancozeb are effective and should be applied during the spring as new leaves and blossoms emerge. Applications are typically timed with weather conditions conducive to infection—cool, wet periods when spores are actively spreading. Pruning infected leaves or twigs from apple trees and removing galls from juniper hosts can reduce the spread. Because the fungus alternates between apple and cedar hosts, controlling the disease may also involve managing or eliminating nearby cedar or juniper trees when feasible.",
    'prevention':
        "Preventing cedar apple rust centers on breaking the disease cycle between the two hosts. One of the most effective strategies is to plant apple cultivars that show resistance, such as ‘Liberty’, ‘Enterprise’, or ‘Redfree’. Avoid planting susceptible apple varieties near cedar or juniper trees, or maintain a distance of at least several hundred meters between them if possible. Regular inspection and removal of rust galls from juniper hosts in winter (before they release spores in spring) can significantly reduce disease pressure. Using fungicides preventively during key infection periods—particularly when both hosts are active—can further protect apple trees, especially in areas where host separation isn’t practical.",
  },
  // Healthy Apple
  {
    'info':
        'The apple tree is healthy, displaying vibrant green leaves that are free from spots, discoloration, or pest damage. The branches are sturdy and support abundant flowering and fruit development. The tree shows strong growth with no signs of disease or stress, producing crisp, well-formed apples during the harvest season.',
    'care':
        'To keep the apple tree healthy, water regularly during dry periods to maintain consistent soil moisture without waterlogging. Apply balanced fertilizers in early spring and after harvest to support growth and fruit production. Prune annually to remove dead, diseased, or overcrowded branches, improving air circulation and sunlight penetration. Ensure the tree receives at least 6-8 hours of full sun daily. Monitor for pests like codling moths and diseases such as apple scab or cedar apple rust, and manage them promptly. Mulch around the base to conserve moisture and reduce weeds.',
  },
  // Background (No Leaves)
  {
    'info':
        'This image shows a background with no leaves or plant material present. It serves as a neutral backdrop in the dataset, useful for distinguishing plant features from non-plant areas. Background images help improve the accuracy of plant disease detection models by providing context and aiding in proper classification.',
  },
  // Healthy Blueberry
  {
    'info':
        'The blueberry plant is healthy, featuring vibrant green, glossy leaves free from spots or discoloration. The plant produces abundant clusters of flowers and well-formed berries. Strong root development supports nutrient uptake and drought tolerance, ensuring consistent growth and fruiting.',
    'care':
        'Maintain a healthy blueberry plant by planting in well-drained, acidic soil (pH 4.5 to 5.5) rich in organic matter. Water regularly to keep the soil moist but not soggy, especially during flowering and fruiting periods. Apply acid-specific fertilizers in early spring and after harvest to promote growth and berry production. Ensure the plant receives full sun for at least 6 hours daily. Prune annually to remove old or weak branches, enhancing air circulation and light penetration. Mulch around the base to retain moisture, regulate soil temperature, and suppress weeds. Monitor for pests such as blueberry maggot and diseases like mummy berry, and treat promptly if needed.',
  },
  // Cherry Powdery Mildew
  {
    'info':
        'Cherry powdery mildew is a fungal disease caused primarily by Podosphaera clandestina, affecting both sweet and sour cherry trees. It is most prevalent in warm, dry climates with high humidity. The disease initially appears as white, powdery fungal growth on the surface of young leaves, shoots, and fruit. As the infection progresses, affected leaves may curl, become distorted, or drop prematurely. Fruit may develop russeted, cracked, or deformed skins, significantly reducing market quality. The fungus overwinters in dormant buds and resumes activity in spring as new growth emerges.',
    'treatment':
        'Treatment for cherry powdery mildew focuses on timely fungicide applications and cultural management. Fungicides such as sulfur, myclobutanil, or potassium bicarbonate can be effective, particularly when applied preventatively at early signs of infection or during high-risk periods. Repeated applications may be necessary depending on weather conditions and disease severity. Pruning to increase air circulation, removing infected plant parts, and avoiding excessive nitrogen fertilization also contribute to disease suppression by reducing humidity and susceptibility.',
    'prevention':
        'Preventing cherry powdery mildew involves integrated orchard management practices. Choose disease-resistant cherry varieties when possible. Maintain proper spacing and prune trees to improve light penetration and airflow, which help reduce humidity within the canopy. Avoid overhead irrigation, especially during evening hours, to limit leaf wetness. Regular monitoring of young shoots and early application of fungicides during favorable conditions—typically warm and humid weather—are essential. Keeping trees healthy through balanced fertilization and proper sanitation by removing infected debris can also significantly reduce disease pressure.',
  },
  // Healthy Cherry
  {
    'info':
        'The cherry tree is healthy, with glossy, vibrant green leaves free from spots, holes, or discoloration. The branches are strong, supporting abundant blossoms and well-formed fruit. The tree exhibits vigorous growth, with no signs of pests or diseases affecting leaves, bark, or fruit.',
    'care':
        'To maintain a healthy cherry tree, water deeply and regularly, especially during dry spells and fruit development. Apply balanced fertilizer in early spring and after harvest to promote strong growth and fruit production. Prune annually to remove dead, diseased, or overcrowded branches, improving air circulation and sunlight penetration. Ensure the tree receives full sun for at least 6-8 hours daily. Monitor frequently for pests like cherry fruit flies and diseases such as powdery mildew or brown rot, and manage them promptly. Mulching helps retain soil moisture and suppress weeds.',
  },
  // Corn Gray Leaf Spot
  {
    'info':
        'Corn gray leaf spot is a serious fungal disease caused by *Cercospora zeae-maydis*, commonly affecting corn crops in humid and warm climates. It primarily targets leaf tissue, where it begins as small, rectangular, tan lesions with distinct gray centers and yellow halos. As the disease progresses, these lesions may coalesce, causing large areas of leaf necrosis that severely reduce photosynthesis and plant vigor. Severe infections can lead to premature leaf death, reduced grain fill, and significant yield losses. The fungus overwinters in infected crop residue and spreads via windborne spores during periods of high humidity and leaf wetness.',
    'treatment':
        'Treatment for gray leaf spot involves timely fungicide application and residue management. Fungicides such as strobilurins (e.g., azoxystrobin) and triazoles (e.g., propiconazole) are commonly used and are most effective when applied at early disease onset, typically between the V6 and VT stages. Crop rotation and tillage can help reduce infected residue on the soil surface, thereby lowering inoculum levels for the next season. Monitoring weather conditions and using disease forecasting models can aid in deciding the optimal timing for fungicide sprays.',
    'prevention':
        'Preventing gray leaf spot requires a combination of cultural and chemical strategies. Planting resistant corn hybrids is one of the most effective ways to minimize disease impact. Avoiding continuous corn planting and practicing crop rotation with non-host crops like soybeans or small grains helps disrupt the disease cycle. Reducing surface residue through tillage and managing irrigation to avoid prolonged leaf wetness can also lower infection risk. Scouting fields regularly and applying fungicides during vulnerable growth stages when environmental conditions favor the disease are essential parts of a successful integrated management approach.',
  },
  // Corn Common Rust
  {
    'info':
        'Corn common rust is a fungal disease caused by *Puccinia sorghi*, affecting corn plants in temperate and tropical regions. It is characterized by the formation of reddish-brown pustules (uredinia) primarily on the upper and lower surfaces of leaves. These pustules are oval to elongated and contain rust-colored spores. As the disease progresses, heavy infection can lead to leaf chlorosis, tissue necrosis, and premature senescence, reducing photosynthetic capacity and potentially impacting yields. The fungus survives on alternate hosts and spreads to corn via windborne spores early in the growing season.',
    'treatment':
        'Treatment of corn common rust focuses on early detection and timely fungicide applications. Triazole and strobilurin-based fungicides, such as propiconazole and azoxystrobin, are effective when applied preventatively or at the first signs of disease. Applications should be made during the early reproductive stages if rust pressure is high. Scouting fields regularly during periods of moderate temperatures and high humidity helps identify infections early. In severely affected fields, a second fungicide application may be necessary to protect foliage during critical grain fill stages.',
    'prevention':
        'Preventing corn common rust starts with planting resistant hybrids, which greatly reduce the risk of infection. Crop rotation and destruction of alternate hosts (such as certain *Oxalis* species) can also help break the disease cycle. Selecting planting dates to avoid peak spore arrival, along with maintaining good field hygiene and monitoring environmental conditions, are key. In areas with a history of rust problems, integrating resistant varieties with strategic fungicide use provides effective protection and minimizes potential yield losses.',
  },
  // Corn Northern Leaf Blight
  {
    'info':
        'Corn Northern Leaf Blight (NLB) is a common and destructive fungal disease caused by *Exserohilum turcicum*. It affects corn plants mainly in regions with moderate temperatures and high humidity. The disease manifests as long, elliptical, gray-green to tan lesions on leaves, which can expand up to several inches. These lesions reduce the photosynthetic area, weakening the plant and potentially leading to significant yield loss, especially if infection occurs early or during critical growth stages. The pathogen survives in infected crop debris and spreads via windborne spores, particularly during prolonged periods of leaf wetness.',
    'treatment':
        'Treatment of Northern Leaf Blight involves fungicide applications and cultural control. Effective fungicides include strobilurins (e.g., azoxystrobin), triazoles (e.g., propiconazole), or premixes. These should be applied preventatively or at disease onset, ideally between V6 and R1 stages when environmental conditions favor infection. Fields with a history of NLB or planted with susceptible hybrids may require more vigilant management. Crop residue management through tillage and rotating to non-host crops can reduce the fungal inoculum in subsequent seasons.',
    'prevention':
        'Prevention of Northern Leaf Blight relies heavily on planting resistant corn hybrids and implementing good field hygiene. Avoid continuous corn planting and practice crop rotation to disrupt the disease cycle. Reducing surface crop residue through tillage helps limit fungal survival. Monitoring environmental conditions like temperature and leaf wetness can help time fungicide applications more effectively. Scouting regularly for early signs of lesions and managing irrigation to avoid prolonged leaf wetness are also key to keeping the disease under control.',
  },
  // Healthy Corn
  {
    'info':
        'The corn plant is healthy, exhibiting tall, strong stalks with vibrant green leaves free from spots, discoloration, or insect damage. The plant shows well-developed roots and tassels, indicating good nutrient uptake and reproductive readiness. Healthy corn plants have vigorous growth, producing ears with well-formed kernels.',
    'care':
        'Maintain healthy corn by providing consistent watering, especially during tasseling and ear development stages, while avoiding waterlogging. Use well-drained soil rich in organic matter and apply balanced fertilization focusing on nitrogen to support leafy growth and grain filling. Ensure full sun exposure for at least 6-8 hours daily. Practice crop rotation to reduce pest and disease buildup. Regularly scout for pests such as corn borers and diseases like rust, and manage promptly. Proper weed control and soil aeration also contribute to robust corn growth.',
  },
  // Grape Black Rot
  {
    'info':
        'Grape black rot is a fungal disease caused by *Guignardia bidwellii* that affects grapevines, particularly in warm, humid regions. The disease primarily attacks leaves, shoots, and fruit clusters. On leaves, it produces small, circular, brown to black lesions with dark borders. On fruit, infection starts as small, brown spots that enlarge and turn black, eventually mummifying the berries. Severe infections can lead to defoliation and significant crop loss due to shriveled, unusable fruit. The fungus overwinters in infected plant debris and mummified berries, releasing spores during wet weather to initiate new infections.',
    'treatment':
        'Treatment includes timely application of fungicides such as captan, myclobutanil, or thiophanate-methyl during the growing season, especially from pre-bloom through early fruit development stages. Removing and destroying mummified fruit and infected plant debris reduces the primary sources of inoculum. Proper canopy management through pruning to improve air circulation and reduce humidity can also help limit fungal growth. Regular monitoring during wet periods allows for timely fungicide sprays to prevent disease spread.',
    'prevention':
        'Prevention of grape black rot involves selecting resistant grape varieties when available and maintaining good vineyard sanitation. Prune vines to enhance air flow and sunlight penetration, reducing leaf wetness duration. Remove and destroy mummified berries and infected debris during dormant seasons to reduce overwintering inoculum. Applying fungicides preventatively during wet weather, especially during flowering and early fruit development, helps protect the crop. Crop rotation and site selection with good air drainage also contribute to lowering disease pressure.',
  },
  // Grape Esca (Black Measles)
  {
    'info':
        'Grape Esca, also known as Black Measles, is a complex fungal disease caused by a group of fungi including *Phaeomoniella chlamydospora* and *Phaeoacremonium* species. It primarily affects mature grapevines, causing wood decay, leaf symptoms, and fruit disorders. Infected vines may show “tiger stripe” yellowing and necrosis on leaves, with black spots appearing on berries, giving rise to the name “black measles.” The disease progresses slowly, weakening the vine and reducing yield and fruit quality over several years. The fungi enter through pruning wounds and colonize the vascular system, eventually leading to vine decline and death if unmanaged.',
    'treatment':
        'There is no effective cure for Esca once vines are infected. Management focuses on preventative practices such as disinfecting pruning tools and applying fungicide paints to pruning wounds to reduce infection risk. Removing severely affected vines can help limit disease spread in the vineyard. Proper vineyard sanitation, including removal of dead wood and debris, helps reduce fungal inoculum. Some research supports the use of biocontrol agents and trunk renewal techniques, but these are not yet widely adopted.',
    'prevention':
        'Preventing grape Esca involves maintaining vine health and minimizing infection entry points. Use careful pruning techniques to avoid large wounds, and apply wound protectants or fungicides immediately after pruning. Select planting material from certified disease-free nurseries. Avoid excessive vine vigor through balanced fertilization and irrigation management. Regular monitoring for early symptoms and prompt removal of infected wood can slow disease progression. Long-term vineyard sanitation and avoiding stress on vines are key to reducing Esca incidence.',
  },
  // Grape Leaf Blight (Isariopsis Leaf Spot)
  {
    'info':
        'Grape leaf blight, also known as Isariopsis leaf spot, is caused by the fungus *Isariopsis vitis*. It affects grapevine leaves, leading to numerous small, angular, brown to black spots surrounded by yellow halos. In severe cases, spots can coalesce, causing large necrotic areas and premature leaf drop, which weakens the vine and reduces photosynthesis. The disease thrives in warm, humid conditions and spreads rapidly during rainy periods, significantly impacting grape yield and quality if unmanaged.',
    'treatment':
        'Treatment involves the application of fungicides such as copper-based products, mancozeb, or sulfur compounds. These should be applied preventively or at the first signs of disease, with repeat applications during wet and humid weather. Good canopy management, including pruning for improved airflow and sunlight penetration, helps reduce leaf wetness and disease severity. Removing infected leaves and debris from the vineyard floor can also reduce inoculum levels.',
    'prevention':
        'Preventing grape leaf blight includes planting resistant grape varieties when available and maintaining proper vineyard hygiene. Ensuring good air circulation through appropriate pruning and canopy management reduces leaf wetness duration, limiting fungal infection. Avoiding overhead irrigation helps prevent prolonged leaf moisture. Regular scouting and early fungicide application based on environmental conditions are essential for effective disease control. Crop rotation and removal of infected plant material also contribute to long-term prevention.',
  },
  // Healthy Grape
  {
    'info':
        'The grapevine is healthy, showing lush green leaves without discoloration or spots, strong woody canes, and vigorous growth. Clusters of flowers and developing grapes indicate successful pollination and fruit set. The plant’s root system is well-established, supporting nutrient and water uptake for optimal growth.',
    'care':
        'To keep grapevines healthy, water deeply but infrequently, ensuring the soil is well-drained to prevent root diseases. Apply balanced fertilization, particularly nitrogen, during early growth stages, and potassium to support fruit development. Provide full sun exposure for at least 6-8 hours daily. Prune annually during dormancy to remove dead or overcrowded canes, improving air circulation and light penetration. Train vines on trellises or supports to maintain structure and reduce disease risk. Monitor regularly for pests such as grape berry moths and diseases like powdery mildew, and manage them promptly.',
  },
  // Orange Huanglongbing (Citrus Greening)
  {
    'info':
        'Orange Huanglongbing (HLB), also known as Citrus Greening, is a devastating bacterial disease caused by *Candidatus Liberibacter* species and transmitted by the Asian citrus psyllid. It affects all citrus species and leads to yellowing of leaves, misshapen and bitter fruit, and eventual tree decline and death. Infected trees show blotchy mottling on leaves, asymmetrical fruit, and stunted growth. The disease spreads rapidly through psyllid vectors and infected nursery stock, making it a major threat to citrus production worldwide.',
    'treatment':
        'There is currently no cure for Huanglongbing. Management focuses on controlling the Asian citrus psyllid vector using insecticides and biological controls, such as parasitic wasps. Removing and destroying infected trees helps reduce inoculum sources. Nutritional treatments with foliar sprays of micronutrients may improve tree health temporarily but do not eliminate the disease. Monitoring and early detection are critical for managing the spread within groves.',
    'prevention':
        'Preventing Huanglongbing involves using certified disease-free nursery stock and implementing rigorous psyllid control programs. Regularly scouting orchards for psyllid presence and symptomatic trees allows early intervention. Physical barriers like reflective mulches and insect-proof screens can help reduce vector access. Quarantine measures and strict sanitation practices limit disease spread between groves. Integrating biological control agents and educating growers about vector and disease management are essential for long-term prevention.',
  },
  // Peach Bacterial Spot
  {
    'info':
        'Peach bacterial spot is caused by the bacterium *Xanthomonas arboricola* pv. *pruni*. It primarily affects peach, nectarine, and other stone fruit trees, leading to lesions on leaves, fruit, and twigs. Symptoms include small, water-soaked spots on leaves that enlarge and turn dark brown or black, often surrounded by yellow halos. On fruit, the spots can become sunken and cracked, reducing marketability. Severe infections can cause defoliation and twig dieback, weakening the tree and impacting yield.',
    'treatment':
        'Treatment involves applying copper-based bactericides during the growing season, especially during wet and humid conditions that favor bacterial spread. Timing applications just before rain events can help reduce infections. Pruning and destroying infected twigs and shoots reduces sources of inoculum. Avoiding overhead irrigation and ensuring good air circulation through proper pruning also help limit disease development. Resistant cultivars are limited but can be considered where available.',
    'prevention':
        'Prevention focuses on using disease-free nursery stock and practicing good orchard sanitation, including removing and destroying infected plant material. Pruning should be done during dry weather to minimize bacterial spread. Avoiding overhead irrigation and ensuring adequate spacing for airflow reduce leaf wetness duration. Regular monitoring during susceptible periods and timely copper applications help manage the disease. Selecting resistant or tolerant varieties when possible contributes to long-term prevention.',
  },
  // Healthy Peach
  {
    'info':
        'The peach tree is healthy, displaying vibrant green leaves free from spots or discoloration. Branches are strong and well-structured, supporting abundant flowering and fruit set. The tree shows no signs of pests or diseases, with healthy bark and vigorous growth throughout the growing season.',
    'care':
        'Maintain peach tree health by watering deeply and consistently, especially during dry periods and fruit development stages. Apply balanced fertilizers rich in nitrogen, phosphorus, and potassium in early spring and after harvest to promote growth and fruit production. Prune annually to remove dead or diseased wood, improve airflow, and encourage new growth. Ensure the tree receives full sun for at least 6-8 hours daily. Monitor regularly for pests such as peach tree borers and diseases like brown rot, and manage promptly if detected. Mulching helps retain soil moisture and regulate temperature.',
  },
  // Pepper Bell Bacterial Spot
  {
    'info':
        'Pepper Bell Bacterial Spot is caused by the bacterium *Xanthomonas euvesicatoria* and affects bell pepper plants. It causes small, water-soaked lesions on leaves, stems, and fruit that eventually enlarge, become dark brown to black, and can be surrounded by yellow halos. On fruit, the spots may crack and become raised, leading to reduced quality and marketability. The disease spreads rapidly in warm, wet conditions, often via splashing water, contaminated tools, and infected seeds or transplants.',
    'treatment':
        'Treatment primarily involves the use of copper-based bactericides applied preventatively and at the first sign of symptoms, especially during wet weather. Combining copper with mancozeb or other fungicides may improve control. Crop sanitation, including removal of infected plant debris, is essential. Avoiding overhead irrigation and reducing leaf wetness helps minimize disease spread. Crop rotation and use of certified disease-free seeds or transplants further aid in management.',
    'prevention':
        'Prevention strategies include planting resistant or tolerant pepper varieties when available. Practicing good sanitation by removing and destroying infected plant material reduces inoculum sources. Avoiding overhead irrigation and maintaining adequate plant spacing improves air circulation and reduces leaf wetness duration. Using certified disease-free seeds and transplants helps prevent initial infections. Regular monitoring and timely copper applications during favorable conditions are key components of an integrated disease management approach.',
  },
  // Healthy Pepper Bell
  {
    'info':
        'The bell pepper plant is healthy, with deep green, glossy leaves and sturdy stems supporting vibrant, well-formed fruits. The plant shows no signs of wilting, discoloration, or pest damage. Healthy root development ensures efficient nutrient and water uptake, promoting steady growth and abundant fruit production.',
    'care':
        'To maintain a healthy bell pepper plant, water consistently to keep the soil evenly moist but well-drained, avoiding water stress or waterlogging. Apply a balanced fertilizer regularly, especially one rich in potassium and calcium, to support fruit development and prevent blossom end rot. Ensure the plant receives full sun for at least 6-8 hours daily. Provide staking or cages to support heavy fruit loads and improve air circulation. Monitor regularly for pests such as aphids and pepper weevils, and manage infestations promptly. Mulching helps retain moisture and control weeds.',
  },
  // Potato Early Blight
  {
    'info':
        'Potato Early Blight is caused by the fungus *Alternaria solani*, affecting potato plants primarily during warm, wet conditions. It causes dark, concentric ringed lesions on older leaves, which can expand and cause premature leaf yellowing and defoliation. Severe infections reduce photosynthesis, leading to smaller tuber size and lower yields. The pathogen survives in crop debris and soil, releasing spores that infect foliage and stems throughout the growing season.',
    'treatment':
        'Treatment involves applying fungicides such as chlorothalonil, mancozeb, or strobilurins (e.g., azoxystrobin) preventatively and during early disease development. Timely applications based on disease forecasting models help optimize control. Removing and destroying infected crop residues reduces inoculum levels. Crop rotation with non-host plants and using certified seed potatoes also assist in managing the disease.',
    'prevention':
        'Preventing early blight includes planting resistant or tolerant potato varieties and practicing crop rotation to reduce pathogen buildup. Proper field sanitation, such as removing and destroying infected debris, helps limit fungal survival. Avoiding overhead irrigation reduces leaf wetness and infection risk. Maintaining balanced fertilization and good irrigation practices supports healthy plants less susceptible to disease. Regular scouting and timely fungicide applications are essential for effective prevention.',
  },
  // Potato Late Blight
  {
    'info':
        'Potato Late Blight is caused by the oomycete *Phytophthora infestans* and is a highly destructive disease affecting potatoes and tomatoes. It thrives in cool, wet, and humid conditions. Symptoms include water-soaked lesions on leaves and stems that rapidly enlarge and turn brown, often with a white fungal growth visible under humid conditions. Infected tubers develop dark, sunken lesions that render them unusable. The disease spreads rapidly and can cause complete crop loss if not managed properly.',
    'treatment':
        'Treatment requires timely applications of fungicides such as metalaxyl, chlorothalonil, or mancozeb, ideally before conditions favor disease development. Regular monitoring of weather conditions and disease forecasting can help optimize spray timing. Removing and destroying infected plant debris reduces sources of inoculum. Using certified disease-free seed potatoes and practicing good field sanitation also contribute to effective control.',
    'prevention':
        'Preventing late blight involves planting resistant potato varieties when available and implementing crop rotation to avoid pathogen buildup. Proper irrigation management to minimize leaf wetness and spacing plants to improve air circulation help reduce infection risk. Maintaining good field hygiene by removing infected debris and volunteer plants is essential. Early detection and rapid response, including fungicide applications, are critical to preventing severe outbreaks.',
  },
  // Healthy Potato
  {
    'info':
        'The potato plant is healthy, showing strong, upright stems and lush green leaves without any signs of yellowing, spots, or wilting. The plant is actively growing with a robust root system and developing tubers underground. Healthy foliage indicates good nutrient uptake and resistance to common pests and diseases.',
    'care':
        'Maintain consistent soil moisture by watering regularly, especially during tuber formation, while avoiding waterlogging that can cause rot. Use well-drained, loose soil rich in organic matter to promote healthy root and tuber growth. Provide balanced fertilization with a focus on potassium and phosphorus to support tuber development. Ensure the potato plants receive full sun for at least 6 hours daily. Practice crop rotation and keep the area free of plant debris to reduce disease risks. Regularly inspect plants for early signs of pests such as potato beetles and manage them promptly.',
  },
  // Healthy Raspberry
  {
    'info':
        'The raspberry plant is healthy, with vibrant green leaves free from discoloration, spots, or wilting. Sturdy canes support abundant flowering and fruit production. The plant exhibits strong root growth and shows no signs of pest infestation or disease, contributing to a bountiful harvest of flavorful berries.',
    'care':
        'To maintain health, water the raspberry plant deeply and consistently, especially during dry spells, while ensuring well-drained soil to prevent root rot. Apply a balanced fertilizer in early spring and again after harvest to promote vigorous growth. Provide full sun exposure for at least 6-8 hours daily to enhance fruit quality and yield. Prune canes annually to remove dead or weak growth, improving air circulation and light penetration. Mulch around the base to conserve moisture, regulate soil temperature, and suppress weeds. Monitor regularly for pests such as aphids and spider mites, and manage promptly if detected.',
  },
  // Healthy Soybean
  {
    'info':
        'The soybean plant is healthy, exhibiting lush green foliage with no signs of discoloration, wilting, or pest damage. Stems are strong and upright, supporting healthy pods that are developing normally. The plant’s robust root system efficiently fixes nitrogen, contributing to vigorous growth and high yield potential.',
    'care':
        'Ensure the soybean plants receive adequate water, especially during flowering and pod filling stages, avoiding water stress while preventing waterlogging. Use well-drained soil rich in organic matter to promote root health. Fertilize based on soil nutrient levels, often focusing on phosphorus and potassium, as soybeans fix their own nitrogen. Provide full sun exposure for at least 6 hours daily. Rotate crops regularly to reduce pest and disease buildup. Scout fields frequently for pests such as soybean aphids and manage them promptly to maintain plant health.',
  },
  // Squash Powdery Mildew
  {
    'info':
        'Squash Powdery Mildew is a common fungal disease caused mainly by *Podosphaera xanthii* and *Erysiphe cichoracearum*. It typically manifests as white to grayish powdery spots on the upper surfaces of squash leaves, stems, and sometimes fruit. As the disease progresses, these powdery patches spread and merge, causing affected leaves to yellow, curl, and eventually dry out and die prematurely. This reduces the plant’s ability to photosynthesize effectively, leading to stunted growth and lower yields. The fungus thrives in warm, dry conditions but needs high humidity for spores to germinate and spread, making it especially problematic in dense plantings with poor air circulation.',
    'treatment':
        'Managing squash powdery mildew involves timely application of fungicides such as sulfur-based products, neem oil, or potassium bicarbonate. Fungicides are most effective when applied early, at the first signs of disease, and should be repeated at recommended intervals to prevent disease progression. Cultural practices like removing severely infected leaves help reduce the amount of fungal spores in the environment. Improving airflow through proper plant spacing and pruning reduces humidity around the foliage, slowing disease development. Organic options such as milk sprays or baking soda mixtures can also be used as supplementary treatments.',
    'prevention':
        'Preventing squash powdery mildew starts with selecting resistant or tolerant varieties when available. Good cultural practices play a crucial role, including planting squash in well-spaced rows to promote air circulation and avoiding excessive nitrogen fertilization that encourages lush, susceptible growth. Overhead irrigation should be avoided to keep foliage dry. Regular scouting and early detection allow for prompt treatment before the disease spreads extensively. Crop rotation and thorough removal of plant debris after harvest reduce overwintering fungal spores, minimizing disease pressure in future growing seasons.',
  },
  // Strawberry Leaf Scorch
  {
    'info':
        'Strawberry Leaf Scorch is a fungal disease caused by *Diplocarpon earliana* that primarily affects strawberry plants. It typically develops in cool, wet conditions during the growing season. Initial symptoms appear as small, purplish or reddish spots on the upper surface of older leaves. These spots enlarge and often develop gray centers with dark borders, eventually causing leaf tissue to die and giving the characteristic “scorched” appearance. Severe infections can lead to extensive leaf blight, premature leaf drop, and reduced photosynthesis, which ultimately impacts fruit yield and quality.',
    'treatment':
        'Treatment involves applying fungicides such as captan, chlorothalonil, or thiophanate-methyl according to recommended schedules, especially during wet and humid weather conditions that favor disease development. Regular fungicide applications during early disease onset can significantly reduce disease spread. Removing and destroying infected leaves and plant debris helps minimize the sources of fungal spores. Improving air circulation through proper spacing and mulching also reduces humidity around the plants, limiting disease severity.',
    'prevention':
        'Preventing strawberry leaf scorch starts with planting disease-free, certified nursery stock and selecting resistant or tolerant strawberry varieties when available. Good cultural practices like avoiding overhead irrigation, ensuring proper plant spacing for adequate airflow, and maintaining balanced fertilization support healthy plants less prone to infection. Sanitation measures, including timely removal of infected leaves and thorough cleaning of equipment and tools, help prevent the spread of the fungus. Crop rotation and avoiding planting strawberries in the same soil year after year reduce the buildup of fungal inoculum.',
  },
  // Healthy Strawberry
  {
    'info':
        'The strawberry plant is healthy, displaying bright green leaves that are free from spots, discoloration, or wilting. The plant has strong runners and is producing healthy flowers and fruits without any signs of pests or diseases. A vigorous root system supports robust growth and nutrient absorption, helping the plant to produce sweet, juicy berries throughout the growing season.',
    'care':
        'To keep the strawberry plant thriving, water regularly to maintain consistently moist soil but avoid waterlogging, which can lead to root diseases. Apply a balanced fertilizer during the growing season to encourage healthy leaf and fruit development. Ensure the plant is grown in well-drained, slightly acidic soil with plenty of organic matter. Provide full sunlight for at least 6 hours daily, as strawberries require ample light for fruit production. Remove old or damaged leaves and mulch around the plants to retain moisture and suppress weeds. Monitor for pests like slugs and aphids, and practice good garden hygiene to prevent diseases.',
  },
  // Tomato Bacterial Spot
  {
    'info':
        'Tomato Bacterial Spot is caused by several species of *Xanthomonas* bacteria, primarily *Xanthomonas vesicatoria*. It is a common and destructive disease of tomato plants, affecting leaves, stems, and fruit. Symptoms start as small, water-soaked lesions on leaves that enlarge into angular, dark brown spots with yellow halos. On fruit, spots are raised, scabby, and may crack, reducing fruit quality and marketability. The disease spreads rapidly in warm, wet, and humid conditions, often via splashing water, contaminated tools, and infected seed or transplants.',
    'treatment':
        'Management of tomato bacterial spot includes the application of copper-based bactericides combined with mancozeb or other protective fungicides to improve control. Treatments should begin at the first sign of symptoms and continue regularly during favorable conditions. Removing and destroying infected plant debris and crop rotation help reduce inoculum. Using certified disease-free seeds and transplants, avoiding working in wet fields, and disinfecting tools minimize the risk of spread.',
    'prevention':
        'Preventing tomato bacterial spot involves planting resistant or tolerant varieties when available. Implementing good sanitation practices such as removing diseased plant material, cleaning tools, and avoiding overhead irrigation reduce disease pressure. Crop rotation with non-host plants reduces bacterial buildup in the soil. Regular monitoring during the growing season and timely application of bactericides are crucial to prevent severe outbreaks and protect crop yield and quality.',
  },
  // Tomato Early Blight
  {
    'info':
        'Tomato Early Blight is caused by the fungus *Alternaria solani* and is a common foliar disease affecting tomato plants worldwide. Symptoms begin as small, dark brown to black spots on older leaves, often with concentric rings that give a “target spot” appearance. These lesions enlarge over time, causing leaves to yellow, wither, and drop prematurely. The disease can also affect stems and fruit, leading to reduced photosynthesis, weaker plants, and lower yields. It thrives in warm, wet, and humid conditions and spreads through wind-blown spores and infected plant debris.',
    'treatment':
        'Control of tomato early blight relies on the application of fungicides such as chlorothalonil, mancozeb, or strobilurins (e.g., azoxystrobin). Fungicide treatments are most effective when started early in the season before symptoms become severe and repeated at recommended intervals. Removing and destroying infected plant debris helps reduce sources of inoculum. Crop rotation and use of disease-free transplants also aid in management. Proper irrigation to avoid leaf wetness and good plant spacing improve control by reducing favorable conditions for the fungus.',
    'prevention':
        'Preventing early blight involves planting resistant or tolerant tomato varieties when available and practicing crop rotation with non-host crops to minimize pathogen buildup in the soil. Sanitation measures such as removing infected debris and volunteer plants reduce overwintering fungal spores. Managing irrigation to avoid prolonged leaf wetness and providing adequate plant spacing improve air circulation, reducing disease risk. Regular monitoring and timely fungicide applications are essential parts of an integrated disease management strategy.',
  },
  // Tomato Late Blight
  {
    'info':
        'Tomato Late Blight is a devastating disease caused by the oomycete *Phytophthora infestans*, the same pathogen responsible for the Irish potato famine. It primarily affects foliage, stems, and fruit of tomato plants. Symptoms start as irregularly shaped, water-soaked lesions on leaves, which quickly turn brown and may be surrounded by a pale green halo. Under humid conditions, a white, fuzzy fungal growth may be visible on the undersides of affected leaves. Infected fruit develop large, greasy-looking, brown lesions and may rot rapidly. The disease thrives in cool, moist environments and spreads quickly via airborne spores.',
    'treatment':
        'Management of tomato late blight involves prompt removal and destruction of infected plants to reduce spread. Fungicides containing active ingredients such as chlorothalonil, mancozeb, or copper-based compounds can provide protection if applied preventively or at the first sign of disease. Systemic fungicides like fluopicolide or cyazofamid may be used in severe outbreaks. It is essential to maintain a regular spray schedule, especially under conducive weather conditions. Sanitation, including removing volunteer plants and solanaceous weeds, is also crucial for effective control.',
    'prevention':
        'Preventive strategies include planting resistant tomato varieties when available and avoiding overhead irrigation to limit leaf wetness. Proper plant spacing and staking enhance air circulation, reducing humidity around foliage. Practicing crop rotation and avoiding planting tomatoes near potatoes, which are also susceptible to late blight, helps reduce disease pressure. Monitoring weather conditions and using disease forecasting models can guide timely fungicide applications. Starting the season with certified disease-free transplants and maintaining field hygiene are key components of a successful prevention plan.',
  },
  // Tomato Leaf Mold
  {
    'info':
        'Tomato Leaf Mold is caused by the fungus *Passalora fulva* (formerly *Cladosporium fulvum*), which primarily affects tomato leaves. It thrives in warm, humid environments, especially in greenhouses or densely planted fields. Symptoms start as pale yellow spots on the upper leaf surfaces that enlarge and turn brown. On the underside of leaves, characteristic olive-green to grayish mold growth appears, often in a velvety texture. The disease causes leaf yellowing, curling, and premature leaf drop, which reduces the plant’s photosynthetic capacity and overall vigor.',
    'treatment':
        'Managing tomato leaf mold involves applying fungicides such as chlorothalonil, copper-based products, or strobilurin fungicides at the first sign of symptoms and continuing treatments regularly under favorable conditions. Improving air circulation through proper spacing and pruning reduces humidity around the foliage, making the environment less conducive to fungal growth. Removing heavily infected leaves helps reduce the amount of fungal spores and slows disease spread.',
    'prevention':
        'Preventing tomato leaf mold starts with good cultural practices such as ensuring adequate plant spacing and ventilation to lower humidity levels. Avoiding overhead irrigation and watering early in the day helps leaves dry faster. Using resistant tomato varieties when available and practicing crop rotation with non-host plants reduce disease pressure. Regular monitoring and prompt fungicide applications at the onset of favorable conditions are important to prevent outbreaks.',
  },
  // Tomato Septoria Leaf Spot
  {
    'info':
        'Tomato Septoria Leaf Spot is caused by the fungus *Septoria lycopersici* and is one of the most common and destructive foliar diseases of tomato plants. It thrives in warm, wet conditions and primarily affects older leaves. Symptoms begin as small, water-soaked circular spots that enlarge and develop dark brown to black borders with grayish centers, often containing tiny black fruiting bodies called pycnidia. Severe infections lead to extensive leaf yellowing, browning, and premature leaf drop, reducing photosynthesis and weakening plants, which can significantly reduce yield.',
    'treatment':
        'Controlling Septoria leaf spot requires timely fungicide applications such as chlorothalonil, mancozeb, or copper-based products, especially during wet and humid weather. Treatments should start at the first appearance of symptoms and be repeated as necessary. Removing and destroying infected leaves and plant debris helps reduce sources of fungal spores. Crop rotation and planting disease-free transplants also contribute to effective management. Proper irrigation practices, avoiding overhead watering, and ensuring good plant spacing improve air circulation to minimize favorable conditions for disease development.',
    'prevention':
        'Preventing Septoria leaf spot involves planting resistant tomato varieties when available and maintaining good sanitation by removing and destroying infected plant material. Crop rotation with non-host plants helps prevent buildup of the pathogen in the soil. Managing irrigation to avoid prolonged leaf wetness and improving air circulation by proper spacing and pruning reduce disease risk. Regular monitoring and early fungicide applications are essential to protect plant health and maximize yield.',
  },
  // Tomato Spider Mites
  {
    'info':
        'Tomato Spider Mites, primarily the two-spotted spider mite (*Tetranychus urticae*), are tiny arachnids that feed on tomato plant cells by piercing and sucking out the contents. Infestations often start on the undersides of leaves and cause stippling—tiny yellow or white spots on leaf surfaces. As populations increase, leaves may become bronzed, curl, dry out, and eventually drop prematurely. Spider mites thrive in hot, dry conditions and can reproduce rapidly, leading to significant damage and reduced plant vigor if not controlled.',
    'treatment':
        'Controlling tomato spider mites involves using miticides specifically formulated to target mites, such as abamectin or spiromesifen, applied according to label instructions. Insecticidal soaps and horticultural oils can also be effective when used thoroughly on infested foliage. Introducing or conserving natural predators like predatory mites (*Phytoseiulus persimilis*) can provide biological control. Regular monitoring and early intervention are crucial to prevent severe infestations.',
    'prevention':
        'Preventing spider mite outbreaks involves maintaining adequate irrigation and humidity, as spider mites prefer dry conditions. Avoiding excessive nitrogen fertilization helps reduce lush, mite-attractive foliage. Encouraging beneficial predatory insects by minimizing broad-spectrum insecticide use supports natural mite control. Regularly inspecting plants, especially the undersides of leaves, allows early detection and timely treatment. Crop rotation and good sanitation by removing plant debris can also reduce mite populations.',
  },
  // Tomato Target Spot
  {
    'info':
        'Tomato Target Spot is a fungal disease caused by *Corynespora cassiicola* that affects tomato leaves and fruit. It is characterized by distinctive circular leaf spots with concentric rings, resembling a target pattern. These spots start as small, water-soaked lesions that enlarge and turn brown to tan with dark margins. Severe infections can lead to premature leaf drop, reduced photosynthesis, and fruit blemishes, negatively impacting yield and marketability. The disease thrives in warm, humid environments and spreads through rain splash, wind, and contaminated tools or plant debris.',
    'treatment':
        'Managing tomato target spot includes the timely application of fungicides such as chlorothalonil, mancozeb, or strobilurin-based products. Fungicide treatments should begin at the first sign of symptoms and continue regularly under conducive weather conditions. Removing infected leaves and plant debris helps reduce fungal inoculum. Good sanitation and crop rotation with non-host plants also aid in managing the disease.',
    'prevention':
        'Preventing target spot involves planting resistant or tolerant tomato varieties when available and maintaining proper plant spacing to improve air circulation and reduce humidity. Avoiding overhead irrigation or watering early in the day helps keep foliage dry. Practicing good sanitation by removing infected plant material and disinfecting tools minimizes disease spread. Monitoring crops regularly and applying fungicides preventively during periods favorable for disease development are key to effective control.',
  },
  // Tomato Yellow Leaf Curl Virus
  {
    'info':
        'Tomato Yellow Leaf Curl Virus (TYLCV) is a serious viral disease transmitted by the whitefly (*Bemisia tabaci*). It affects tomato plants worldwide, causing symptoms such as yellowing and curling of young leaves, stunted growth, reduced fruit size, and lower yields. Infected plants often display upward leaf curling and vein thickening, leading to significant crop losses. The virus can spread rapidly in warm climates where whitefly populations thrive.',
    'treatment':
        'There is no direct cure for plants infected with TYLCV. Management focuses on controlling the whitefly vector through insecticides, reflective mulches, and physical barriers such as insect-proof screens. Removing and destroying infected plants helps reduce virus sources. Using yellow sticky traps can monitor and reduce whitefly populations. Integrated pest management strategies combining cultural, biological, and chemical controls are essential to limit virus spread.',
    'prevention':
        'Preventing Tomato Yellow Leaf Curl Virus involves planting resistant or tolerant tomato varieties and using certified virus-free seeds or transplants. Controlling whitefly populations by maintaining good field sanitation, employing insect-proof greenhouses, and applying insecticides when necessary reduces infection risk. Crop rotation with non-host plants and avoiding planting tomatoes near infested fields further limits virus spread. Early detection and rapid removal of infected plants help protect healthy crops.',
  },
  // Tomato Mosaic Virus
  {
    'info':
        'Tomato Mosaic Virus (ToMV) is a widespread viral disease affecting tomato plants, caused by a tobamovirus. It is highly contagious and can spread through infected seeds, contaminated tools, handling, and mechanical transmission. Symptoms include mottled light and dark green patterns on leaves, leaf curling, distortion, and stunted growth. Fruit may show uneven ripening, blotchy patches, and reduced size and quality. The virus can persist in plant debris and soil, making management challenging.',
    'treatment':
        'There is no chemical cure for Tomato Mosaic Virus. Management relies on preventing virus introduction and spread by using certified virus-free seeds and transplants, disinfecting tools and equipment regularly, and practicing good sanitation. Removing and destroying infected plants promptly helps reduce inoculum. Avoiding working with plants when wet minimizes mechanical transmission. Crop rotation and weed control reduce alternate virus hosts.',
    'prevention':
        'Preventing Tomato Mosaic Virus focuses on cultural practices such as using resistant tomato varieties and ensuring strict hygiene measures. Clean tools and hands before handling plants, avoid contact with infected plants, and sanitize greenhouse structures regularly. Using disease-free seed sources and practicing crop rotation with non-host crops help minimize virus presence. Early detection and rogueing infected plants prevent widespread outbreaks and protect crop yield and quality.',
  },
  // Healthy Tomato
  {
    'info':
        'The tomato plant is healthy, exhibiting lush, vibrant green foliage and strong, sturdy stems. Leaves are free from discoloration, spots, or curling, indicating the absence of pests and diseases. The plant is actively growing, flowering, and setting fruit under favorable conditions. Healthy root development supports nutrient uptake and overall vigor, while proper pollination ensures good fruit quality and yield.',
    'care':
        'To maintain optimal health, water the tomato plant consistently, aiming to keep the soil evenly moist but well-drained to prevent root rot. Apply a balanced fertilizer rich in nitrogen, phosphorus, and potassium at regular intervals to support leaf growth and fruit development. Ensure the plant receives at least 6 to 8 hours of direct sunlight daily, as adequate light is essential for photosynthesis and flowering. Provide support with stakes, cages, or trellises to keep the plant upright, improve airflow, and reduce the risk of disease. Regularly inspect the plant for early signs of pests or diseases, and promptly remove any damaged or yellowing leaves to promote good air circulation and plant health.',
  },
];
