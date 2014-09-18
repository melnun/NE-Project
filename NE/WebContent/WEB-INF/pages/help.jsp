<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
   
<style>

.hidden{
visibility : hidden

}

</style>
<div id="help-dialog" title="Help" class="hidden"  >

<p class=MsoNormal style='margin-left:54.0pt'><b><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal><b><span style='color:#1F497D'>Pagina di ricerca:<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Attraverso
questa pagina si ha la possibilità di effettuare la ricerca dei dipendenti
utilizzando un motore di ricerca che utilizza tre parametri: nome, cognome o codice postazione.<o:p></o:p></span></p>



<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Inserendo
un minimo di 2 lettere il programma restituirà &nbsp;un elenco di
dipendenti<span style='mso-spacerun:yes'>  </span>visualizzabili su una
tabella.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Cliccando
sul codice postazione di ogni utente il sistema evidenzierà quest&#8217;ultima sulla
mappa dell&#8217;edificio.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Inoltre
è possibile sganciare una postazione da un dipendente utilizzando il pulsante
per la rimozione all&#8217;interno della tabella.<o:p></o:p></span></p>

<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><b><span style='color:#1F497D'>Pagina di inserimento testuale:<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Attraverso
questa pagina si ha la possibilità di inserire un dipendente e la sua posizione
corrispondente, individuabile attraverso una lista di tutte le postazioni
ancora libere.<o:p></o:p></span></p>



<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Durante
l&#8217;inserimento il sistema verificherà se il dipendente che si cerca di inserire
è già esistente. Se ciò &nbsp;non si verifica il sistema censisce il dipendente e lo inserisce nel DB.<o:p></o:p></span></p>



<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Se il
dipendente è già esistente il sistema verifica che lo stesso abbia o meno una
postazione assegnata:<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>in
caso di postazione non assegnata notifica ciò all&#8217;utente e chiede conferma
dell&#8217;inserimento;<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>in
caso di postazione assegnata notifica ciò all&#8217;utente e propone la sostituzione
della vecchia postazione con
la nuova.<o:p></o:p></span></p>



<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><b><span style='color:#1F497D'>Pagina di inserimento
grafica:<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Attraverso
questa pagina si ha la possibilità di visualizzare la mappa delle postazioni ed
inserire un dipendente.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Inizialmente
il sistema verificherà le postazioni segnando sulla mappa quelle occupate e
quelle libere.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Cliccando
su una postazione libera si ha la possibilità di inserire un dipendente in
quella data postazione.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Durante
l&#8217;inserimento il sistema verificherà se il dipendente che si cerca di inserire
è già esistente. Se<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>ciò
&nbsp;non si verifica il sistema censisce il dipendente e lo inserisce nel DB.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Se il
dipendente è già esistente il sistema verifica che lo stesso abbia o meno una
postazione assegnata.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>In
caso di postazione non assegnata notifica ciò all&#8217;utente e chiede conferma
dell&#8217;inserimento.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>In
caso di postazione assegnata notifica ciò all&#8217;utente e propone la sostituzione
della vecchia postazione con la nuova.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:35.4pt'><span style='color:#1F497D'>Cliccando 
su una postazione occupata si avrà la possibilità di liberarla.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:17.4pt'><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

</div>
