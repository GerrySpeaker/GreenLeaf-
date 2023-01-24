$(document).ready(function(){
    var pos = {lat: 41.87194, lng: 12.56738};
    var map = new google.maps.Map(document.getElementById('map'),{
        zoom:6,
        center: pos

    });
});

function seleziona() {

    var reg = document.getElementById("regione").value;

    console.log(reg)

    if(reg.match("Abruzzo")){
        var pos = {lat: 42.35082118354174, lng: 13.398125173519116};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 42.35082118354174, lng: 13.398125173519116},
            map: map,
            title: 'Aquila'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023") || document.getElementById("anno").value.match("Anno")){
            document.getElementById("percentuale").innerHTML="23%";
            document.getElementById("co2").innerHTML="180kg/anno";
            document.getElementById("polvere").innerHTML="36kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="27%";
            document.getElementById("co2").innerHTML="183kg/anno";
            document.getElementById("polvere").innerHTML="39kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="32%";
            document.getElementById("co2").innerHTML="186kg/anno";
            document.getElementById("polvere").innerHTML="42kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="37%";
            document.getElementById("co2").innerHTML="189kg/anno";
            document.getElementById("polvere").innerHTML="45kg/anno";
        }
    }
    else if(reg.match("Basilicata")){
        var pos = {lat: 40.6425088004744, lng: 15.806421937841847};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 40.6425088004744, lng: 15.806421937841847},
            map: map,
            title: 'Potenza'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="51%";
            document.getElementById("co2").innerHTML="181kg/anno";
            document.getElementById("polvere").innerHTML="71kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="56%";
            document.getElementById("co2").innerHTML="184kg/anno";
            document.getElementById("polvere").innerHTML="74kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="61%";
            document.getElementById("co2").innerHTML="187kg/anno";
            document.getElementById("polvere").innerHTML="77kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="66%";
            document.getElementById("co2").innerHTML="190kg/anno";
            document.getElementById("polvere").innerHTML="80kg/anno";
        }
    }
    else if(reg.match("Calabria")){
        var pos = {lat: 38.908301259116584, lng: 16.6053007846292};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 38.908301259116584, lng: 16.6053007846292},
            map: map,
            title: 'Catanzaro'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="65%";
            document.getElementById("co2").innerHTML="55kg/anno";
            document.getElementById("polvere").innerHTML="106kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="70%";
            document.getElementById("co2").innerHTML="58kg/anno";
            document.getElementById("polvere").innerHTML="109kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="70%";
            document.getElementById("co2").innerHTML="61kg/anno";
            document.getElementById("polvere").innerHTML="112kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="70%";
            document.getElementById("co2").innerHTML="64kg/anno";
            document.getElementById("polvere").innerHTML="115kg/anno";
        }
    }
    else if(reg.match("Campania")){
        var pos = {lat: 40.850209995064105, lng: 14.2677241184705};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 40.850209995064105, lng: 14.2677241184705},
            map: map,
            title: 'Napoli'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="53%";
            document.getElementById("co2").innerHTML="355kg/anno";
            document.getElementById("polvere").innerHTML="275kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="58%";
            document.getElementById("co2").innerHTML="358kg/anno";
            document.getElementById("polvere").innerHTML="278kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="63%";
            document.getElementById("co2").innerHTML="358kg/anno";
            document.getElementById("polvere").innerHTML="278kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="68%";
            document.getElementById("co2").innerHTML="358kg/anno";
            document.getElementById("polvere").innerHTML="278kg/anno";
        }
    }
    else if(reg.match("Emilia Romagna")){
        var pos = {lat: 44.50863902142159, lng: 11.345928893896968};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 44.50863902142159, lng: 11.345928893896968},
            map: map,
            title: 'Bologna'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="52%";
            document.getElementById("co2").innerHTML="291kg/anno";
            document.getElementById("polvere").innerHTML="275kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="57%";
            document.getElementById("co2").innerHTML="294kg/anno";
            document.getElementById("polvere").innerHTML="278kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="62%";
            document.getElementById("co2").innerHTML="294kg/anno";
            document.getElementById("polvere").innerHTML="278kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="67%";
            document.getElementById("co2").innerHTML="294kg/anno";
            document.getElementById("polvere").innerHTML="278kg/anno";
        }
    }
    else if(reg.match("Friuli Venezia Giulia")){
        var pos = {lat: 45.6432401129663, lng: 13.800940564444039};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 45.6432401129663, lng: 13.800940564444039},
            map: map,
            title: 'Trieste'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="82%";
            document.getElementById("co2").innerHTML="725kg/anno";
            document.getElementById("polvere").innerHTML="465kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="87%";
            document.getElementById("co2").innerHTML="728kg/anno";
            document.getElementById("polvere").innerHTML="468kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="87%";
            document.getElementById("co2").innerHTML="731kg/anno";
            document.getElementById("polvere").innerHTML="471kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="87%";
            document.getElementById("co2").innerHTML="734kg/anno";
            document.getElementById("polvere").innerHTML="474kg/anno";
        }
    }
    else if(reg.match("Lazio")){
        var pos = {lat: 41.88215155186725, lng: 12.516216555329192};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 41.88215155186725, lng: 12.516216555329192},
            map: map,
            title: 'Roma'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="32%";
            document.getElementById("co2").innerHTML="135kg/anno";
            document.getElementById("polvere").innerHTML="305kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="37%";
            document.getElementById("co2").innerHTML="141kg/anno";
            document.getElementById("polvere").innerHTML="311kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="42%";
            document.getElementById("co2").innerHTML="144kg/anno";
            document.getElementById("polvere").innerHTML="314kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="47%";
            document.getElementById("co2").innerHTML="148kg/anno";
            document.getElementById("polvere").innerHTML="318kg/anno";
        }
    }
    else if(reg.match("Liguria")){
        var pos = {lat: 44.40576535968975, lng: 8.948508416774295};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 44.40576535968975, lng: 8.948508416774295},
            map: map,
            title: 'Genova'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="24%";
            document.getElementById("co2").innerHTML="87kg/anno";
            document.getElementById("polvere").innerHTML="55kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="29%";
            document.getElementById("co2").innerHTML="90kg/anno";
            document.getElementById("polvere").innerHTML="58kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="34%";
            document.getElementById("co2").innerHTML="93kg/anno";
            document.getElementById("polvere").innerHTML="61kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="39%";
            document.getElementById("co2").innerHTML="96kg/anno";
            document.getElementById("polvere").innerHTML="64kg/anno";
        }
    }
    else if(reg.match("Lombardia")){
        var pos = {lat: 45.46834724161193, lng: 9.187993796374455};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 45.46834724161193, lng: 9.187993796374455},
            map: map,
            title: 'Milano'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="80%";
            document.getElementById("co2").innerHTML="703kg/anno";
            document.getElementById("polvere").innerHTML="505kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
                document.getElementById("percentuale").innerHTML="85%";
                document.getElementById("co2").innerHTML="708kg/anno";
                document.getElementById("polvere").innerHTML="508kg/anno";

        }
        else if(document.getElementById("anno").value.match("2025")){
                document.getElementById("percentuale").innerHTML="90%";
                document.getElementById("co2").innerHTML="711kg/anno";
                document.getElementById("polvere").innerHTML="510kg/anno";

        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="95%";
            document.getElementById("co2").innerHTML="714kg/anno";
            document.getElementById("polvere").innerHTML="513kg/anno";

        }
    }
    else if(reg.match("Marche")){
        var pos = {lat: 43.59874238464332, lng: 13.508869766831232};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 43.59874238464332, lng: 13.508869766831232},
            map: map,
            title: 'Ancona'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="90%";
            document.getElementById("co2").innerHTML="1601kg/anno";
            document.getElementById("polvere").innerHTML="962kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="95%";
            document.getElementById("co2").innerHTML="1604kg/anno";
            document.getElementById("polvere").innerHTML="965kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="100%";
            document.getElementById("co2").innerHTML="1609kg/anno";
            document.getElementById("polvere").innerHTML="968kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="100%";
            document.getElementById("co2").innerHTML="1611kg/anno";
            document.getElementById("polvere").innerHTML="971kg/anno";
        }
    }
    else if(reg.match("Molise")){
        var pos = {lat: 41.560719968553386, lng: 14.661498770146911};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 41.560719968553386, lng: 14.661498770146911},
            map: map,
            title: 'Campobasso'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="55%";
            document.getElementById("co2").innerHTML="372kg/anno";
            document.getElementById("polvere").innerHTML="135kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="60%";
            document.getElementById("co2").innerHTML="375kg/anno";
            document.getElementById("polvere").innerHTML="138kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="65%";
            document.getElementById("co2").innerHTML="378kg/anno";
            document.getElementById("polvere").innerHTML="142kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="70%";
            document.getElementById("co2").innerHTML="382kg/anno";
            document.getElementById("polvere").innerHTML="145kg/anno";
        }
    }
    else if(reg.match("Piemonte")){
        var pos = {lat: 45.113413884658534, lng: 7.7442665733748886};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 45.113413884658534, lng: 7.7442665733748886},
            map: map,
            title: 'Torino'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="24%";
            document.getElementById("co2").innerHTML="181kg/anno";
            document.getElementById("polvere").innerHTML="45kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="29%";
            document.getElementById("co2").innerHTML="183kg/anno";
            document.getElementById("polvere").innerHTML="48kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="34%";
            document.getElementById("co2").innerHTML="183kg/anno";
            document.getElementById("polvere").innerHTML="48kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="39%";
            document.getElementById("co2").innerHTML="183kg/anno";
            document.getElementById("polvere").innerHTML="48kg/anno";
        }
    }
    else if(reg.match("Puglia")){
        var pos = {lat: 41.11501, lng: 16.88026};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 41.11501, lng: 16.88026},
            map: map,
            title: 'Bari'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="33%";
            document.getElementById("co2").innerHTML="207kg/anno";
            document.getElementById("polvere").innerHTML="95kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="38%";
            document.getElementById("co2").innerHTML="210kg/anno";
            document.getElementById("polvere").innerHTML="98kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="43%";
            document.getElementById("co2").innerHTML="210kg/anno";
            document.getElementById("polvere").innerHTML="98kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="48%";
            document.getElementById("co2").innerHTML="210kg/anno";
            document.getElementById("polvere").innerHTML="98kg/anno";
        }
    }
    else if(reg.match("Sardegna")){
        var pos = {lat: 39.23321232408336, lng: 9.119699028795637};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 39.23321232408336, lng: 9.119699028795637},
            map: map,
            title: 'Cagliari'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="38%";
            document.getElementById("co2").innerHTML="201kg/anno";
            document.getElementById("polvere").innerHTML="105kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="43%";
            document.getElementById("co2").innerHTML="204kg/anno";
            document.getElementById("polvere").innerHTML="108kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="48%";
            document.getElementById("co2").innerHTML="207kg/anno";
            document.getElementById("polvere").innerHTML="111kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="53%";
            document.getElementById("co2").innerHTML="210kg/anno";
            document.getElementById("polvere").innerHTML="114kg/anno";
        }
    }
    else if(reg.match("Sicilia")){
        var pos = {lat: 38.201255146219175, lng: 13.364531778358215};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 38.201255146219175, lng: 13.364531778358215},
            map: map,
            title: 'Palermo'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="10%";
            document.getElementById("co2").innerHTML="9kg/anno";
            document.getElementById("polvere").innerHTML="6kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="15%";
            document.getElementById("co2").innerHTML="12kg/anno";
            document.getElementById("polvere").innerHTML="9kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="20%";
            document.getElementById("co2").innerHTML="15kg/anno";
            document.getElementById("polvere").innerHTML="12kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="25%";
            document.getElementById("co2").innerHTML="18kg/anno";
            document.getElementById("polvere").innerHTML="15kg/anno";
        }
    }
    else if(reg.match("Toscana")){
        var pos = {lat: 43.826683594091726, lng: 11.169111272934023};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 43.826683594091726, lng: 11.169111272934023},
            map: map,
            title: 'Firenze'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="88%";
            document.getElementById("co2").innerHTML="1530kg/anno";
            document.getElementById("polvere").innerHTML="1032kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="93%";
            document.getElementById("co2").innerHTML="1533kg/anno";
            document.getElementById("polvere").innerHTML="1035kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="98%";
            document.getElementById("co2").innerHTML="1536kg/anno";
            document.getElementById("polvere").innerHTML="1038kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="100%";
            document.getElementById("co2").innerHTML="1539kg/anno";
            document.getElementById("polvere").innerHTML="1041kg/anno";
        }
    }
    else if(reg.match("Trentino Alto Adige")){
        var pos = {lat: 46.104550415071785, lng: 11.084905929986924};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 46.104550415071785, lng: 11.084905929986924},
            map: map,
            title: 'Trento'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="14%";
            document.getElementById("co2").innerHTML="24kg/anno";
            document.getElementById("polvere").innerHTML="35kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="17%";
            document.getElementById("co2").innerHTML="27kg/anno";
            document.getElementById("polvere").innerHTML="38kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="22%";
            document.getElementById("co2").innerHTML="27kg/anno";
            document.getElementById("polvere").innerHTML="38kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="27%";
            document.getElementById("co2").innerHTML="27kg/anno";
            document.getElementById("polvere").innerHTML="38kg/anno";
        }
    }
    else if(reg.match("Umbria")){
        var pos = {lat: 43.115972355431026, lng: 12.385648762690183};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 43.115972355431026, lng: 12.385648762690183},
            map: map,
            title: 'Perugia'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="25%";
            document.getElementById("co2").innerHTML="187kg/anno";
            document.getElementById("polvere").innerHTML="408kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="30%";
            document.getElementById("co2").innerHTML="190kg/anno";
            document.getElementById("polvere").innerHTML="411kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="35%";
            document.getElementById("co2").innerHTML="193kg/anno";
            document.getElementById("polvere").innerHTML="414kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="40%";
            document.getElementById("co2").innerHTML="195kg/anno";
            document.getElementById("polvere").innerHTML="417kg/anno";
        }
    }
    else if(reg.match("Valle dAosta")){
        var pos = {lat: 45.73485927388434, lng: 7.31258757789066};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 45.73485927388434, lng: 7.31258757789066},
            map: map,
            title: 'Aosta'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML="Valle d'Aosta";
        document.getElementById("percentuale").innerHTML="32%";
        document.getElementById("co2").innerHTML="206kg/anno";
        document.getElementById("polvere").innerHTML="330kg/anno";
    }
    else if(reg.match("Veneto")){
        var pos = {lat: 45.477348699590294, lng: 12.287436819104528};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 10});

        var marker = new google.maps.Marker({
            position: {lat: 45.477348699590294, lng: 12.287436819104528},
            map: map,
            title: 'Verona'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML=reg;
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="57%";
            document.getElementById("co2").innerHTML="437kg/anno";
            document.getElementById("polvere").innerHTML="470kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="62%";
            document.getElementById("co2").innerHTML="440kg/anno";
            document.getElementById("polvere").innerHTML="473kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="67%";
            document.getElementById("co2").innerHTML="443kg/anno";
            document.getElementById("polvere").innerHTML="476kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="72%";
            document.getElementById("co2").innerHTML="443kg/anno";
            document.getElementById("polvere").innerHTML="476kg/anno";
        }
    }
    else if(reg.match("Nazionale")){
        var pos = {lat: 41.87194, lng: 12.56738};
        var map = new google.maps.Map(document.getElementById('map'),
        {center: pos ,zoom: 6});

        var marker = new google.maps.Marker({
            position: {lat: 41.87194, lng: 12.56738},
            map: map,
            title: 'Italia'
        });

        document.getElementById("monitor").style.display="block";
        document.getElementById("selezionato").innerHTML="Italia";
        if(document.getElementById("anno").value.match("2023")){
            document.getElementById("percentuale").innerHTML="60%";
            document.getElementById("co2").innerHTML="437kg/anno";
            document.getElementById("polvere").innerHTML="470kg/anno";
        }
        else if(document.getElementById("anno").value.match("2024")){
            document.getElementById("percentuale").innerHTML="65%";
            document.getElementById("co2").innerHTML="440kg/anno";
            document.getElementById("polvere").innerHTML="470kg/anno";
        }
        else if(document.getElementById("anno").value.match("2025")){
            document.getElementById("percentuale").innerHTML="70%";
            document.getElementById("co2").innerHTML="443kg/anno";
            document.getElementById("polvere").innerHTML="470kg/anno";
        }
        else if(document.getElementById("anno").value.match("2026")){
            document.getElementById("percentuale").innerHTML="75%";
            document.getElementById("co2").innerHTML="446kg/anno";
            document.getElementById("polvere").innerHTML="470kg/anno";
        }

    }

}