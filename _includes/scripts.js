$(document).ready(function() {

    $("#contact-me").mailto();

    $("#my-cv").mailto();
    $("#my-cv").autolink();

    $('#show-pdf').click(function() {
        var pdfUrl = 'https://github.com/ktoso/cv/raw/master/konrad_malawski_cv.pdf';
        $('#pdf-container').html('<iframe src="http://docs.google.com/gview?url=' + pdfUrl + '&embedded=true" style="width:100%; height:700px;" frameborder="0"></iframe>');
    });

    getAllRepos('ktoso');
});


function getAllRepos(username) {
    var url = 'http://github.com/api/v2/json/repos/show/' + username + '?callback=?';
    var repoTmpl = "repo";
    $.template(repoTmpl, "<li><a href=\"${url}\" title=\"${title}\">${name}</a></li>");

    $.getJSON(url, function(data, textStatus) {
        console.log('got data');

        var container = $('#other-projects');
        var list = $('<ul></ul>');
        container.append(list);

        $.each(data.repositories, function(index, repo) {
            $.tmpl(repoTmpl, repo).appendTo(list);
        });
    });
}