<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="risorse/style/homepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<%@ include file="header.jsp" %>


<div class="all-parallax">
    <section class="parallax">
        <h2 id="text-home" >Benvenuto su <br> Green Leaf</h2>
        <img src="risorse/img/monutain_01.png" id="m1">
        <img src="risorse/img/trees_02.png" id="t2">
        <img src="risorse/img/monutain_02.png" id="m2">
        <img src="risorse/img/trees_01.png" id="t1">
        <img src="risorse/img/man.png" id="man">
        <img src="risorse/img/plants.png" id="plants">
    </section>
    <section class="home-text1">
        <h2>Il nostro obiettivo</h2>
        <p>
            It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. 
            The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. 
            Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. 
            Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sollicitudin maximus augue, at malesuada purus ornare nec. Morbi aliquet et lacus vel tincidunt. Sed eu nunc ornare, venenatis elit quis, lacinia lectus. Phasellus id orci ex. Etiam ut condimentum risus. Vivamus tincidunt lacus eu sapien luctus, ut fringilla leo tempor. Phasellus in ex porttitor, varius ipsum et, accumsan nulla.
            Fusce eleifend semper leo, sit amet eleifend ex convallis at. Proin dictum nulla eu libero scelerisque, vitae porta nulla mattis. Aenean semper eu dolor eget elementum. Morbi in ante id mauris gravida facilisis. Nullam lobortis, est eget venenatis hendrerit, felis nunc euismod dui, non ultrices erat mauris non turpis. Phasellus vel elit ac metus egestas euismod sit amet et nunc. Sed viverra eros lectus, nec maximus dolor finibus ut. Curabitur et mauris a diam aliquet consectetur. Aliquam ornare tempor erat at dictum. Quisque euismod id ex eu dignissim.
            <br>
            Cras nec pulvinar augue, eget pulvinar leo. Sed semper lacus tellus, et gravida mauris volutpat a. Etiam tincidunt laoreet dapibus. Cras erat sapien, tristique vel vulputate ac, venenatis auctor velit. Sed sed quam at tellus malesuada vestibulum. Proin tempus mauris ac odio maximus convallis. Donec malesuada semper ornare. Duis varius elementum est, nec sollicitudin neque pellentesque varius. Cras quis suscipit orci. Nullam hendrerit, magna quis tincidunt posuere, purus elit aliquam nunc, sed tempor elit nibh sit amet augue. Donec rutrum at nisi ac aliquam. Praesent egestas sapien in metus porttitor, vel iaculis ipsum bibendum. Praesent vulputate pellentesque orci non semper. Nam ultricies congue ornare. Quisque tempor felis lectus, at elementum neque tempus ac.
            Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec tempor lacinia consequat. Sed tristique nibh vel libero laoreet suscipit. Sed ut semper ipsum. In volutpat euismod ipsum rutrum elementum. Morbi consequat mauris nulla, ut viverra nisl tincidunt vitae. Maecenas a hendrerit erat. Nunc venenatis viverra libero, vitae posuere purus aliquet quis. Aliquam eget neque hendrerit, tincidunt libero eget, lacinia risus.
        </p>
    </section>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/ScrollTrigger.min.js"></script>
<script>
    gsap.from("#m1", {
        scrollTrigger : {
            scrub: true
        },
        y: 100,
    })
    gsap.from("#m2", {
        scrollTrigger : {
            scrub: true
        },
        y: 50,
    })
    gsap.from("#t2", {
        scrollTrigger : {
            scrub: true
        },
        x: -50,
    })
    gsap.from("#t1", {
        scrollTrigger : {
            scrub: true
        },
        x: 50,
    })
    gsap.from("#man", {
        scrollTrigger : {
            scrub: true
        },
        x: -250,
    })
    gsap.from("#plants", {
        scrollTrigger : {
            scrub: true
        },
        x: -50,
    })
    gsap.from("#text-home", {
        scrollTrigger : {
            scrub: true
        },
        x: 400,
    })
</script>
</html>

<%@ include file="footer.jsp" %>
