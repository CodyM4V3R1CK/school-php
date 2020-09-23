<table border=1>
        <tr>
            <td></td>
            <td>0</td>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
        </tr>
        <tr>
            <td>Pondelok</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Utorok</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Streda</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Štvrtok</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Piatok</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
</table>
<br>

<?php
$dni = array("Pondelok", "Utorok", "Streda", "Štvrtok", "Piatok");
$hodiny = array(0,1,2,3,4,5)
?>

<table border = 1>
    <tr>
        <td>&nbsp;</td>
        <?foreach ($hodiny as $hodina): ?>
            <td> <? echo $hodina;?> </td>
        <?endforeach;?>
    </tr>
    <?foreach($dni as $den): ?>
        <tr>
            <td> <? echo $den;?> </td>
            <?foreach($hodiny as $hodina):?>
            <td> <!-- <?echo $hodina;?> --> </td>
            <?endforeach;?>
        </tr>
    <? endforeach; ?>
</table>