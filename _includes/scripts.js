function setupShowPdf() {
    $('#show-pdf').click(function() {
        // todo optimize
        $(this).hide();
        $('#hide-pdf').show();
        var pdfUrl = 'https://github.com/ktoso/cv/raw/master/konrad_malawski_cv.pdf';

        var pdf = $('#pdf-container');
        pdf.css('display', 'none')
                .html('<iframe src="http://docs.google.com/gview?url=' + pdfUrl + '&embedded=true" style="width:100%; height:700px;" frameborder="0"></iframe>')
                .slideDown();

    });
}
function setupHidePdf() {
    $('#hide-pdf').click(function() {
        // todo optimize
        $(this).hide();
        $('#show-pdf').show();
        $('#pdf-container').hide();
    });
}

function startRepoTicker() {
    $("#other-projects").jCarouselLite({
        vertical: true,
        hoverPause:true,
        visible: 1,
        auto:500,
        speed:1000
    });
}

function initRepoTicker(username) {
    var url = 'http://github.com/api/v2/json/repos/show/' + username + '?callback=?';
    var repoTmpl = "repo";
    $.template(repoTmpl, '<li><a href="${url}" title="${title}">${name}</a></li>');

    $.getJSON(url, function(data, textStatus) {
        console.log('got data');

        var container = $('#other-projects');
        var list = $('<ul></ul>');
        container.append(list);

        $.each(data.repositories, function(index, repo) {
            $.tmpl(repoTmpl, repo).appendTo(list);
        });

        startRepoTicker();
    });
}

//-----------------------------------------------------------------------------

$(document).ready(function() {

    $("#contact-me").mailto();

    $("#my-cv").mailto();
    $("#my-cv").autolink();

    setupHidePdf();
    setupShowPdf();

    initRepoTicker('ktoso');
});