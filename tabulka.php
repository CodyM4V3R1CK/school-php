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
    $hodiny = array(0,1,2,3,4,5,6,7);
    $rozvrh[2] [0] = "PFG";
    $rozvrh[2] [1] = "PFG";
?>

<table border = 1>
    <tr>
        <td>&nbsp;</td>
        <?foreach ($hodiny as $i => $hodina): ?>
            <td> <? echo $hodina;?> </td>
        <?endforeach;?>
    </tr>
    <?foreach($dni as $i => $den): ?>
        <tr>
            <td> <? echo $den;?> </td>
            <?foreach($hodiny as $j => $hodina):?>
            <td> <?echo @ $rozvrh [$i] [$j];?> <!-- <?echo $hodina;?> --> </td>
            <?endforeach;?>
        </tr>
    <? endforeach; ?>
</table>