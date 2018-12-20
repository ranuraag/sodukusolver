<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Solve Sudoku</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <style type="text/css">
            html,
            body {
                background-color: #FAFAFA
            }

            table {
                border: 2px solid #000000;
            }

            td {
                border: 1px solid #000000;
                text-align: center;
                vertical-align: middle;
            }

            input {
                color: #000000;
                padding: 0;
                border: 0;
                text-align: center;
                width: 48px;
                height: 48px;
                font-size: 24px;
                background-color: #FFFFFF;
                outline: none;
            }

            input:disabled {
                background-color: #EEEEEE;
            }

            .top {
                border-top: 2px solid #000000;
            }

            .right {
                border-right: 2px solid #000000;
            }

            .bottom {
                border-bottom: 2px solid #000000;
            }

            .left {
                border-left: 2px solid #000000;
            }

        </style>
        <script>
            // gloabal variable board:
            var board = [];
            for (var i = 0; i < 9; i++) {
                board[i] = [];
            }

            // Load random preset 
            $(document).ready(function() {
                $.ajax({
                    type: "POST",
                    url: "/sudokusolver/services/random",
                    data: JSON.stringify(objWrapper),
                    contentType: 'application/json',
                    success: function(data) {
                        writeBoard(data)
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        //alert("Error, status = " + textStatus + ", " + "error thrown: " + errorThrown);
                    }
                });
            });

            // Solve button clicked
            $(document).ready(function() {
                $("#solvebtn").click(function() {
                    var objWrapper = {};
                    objWrapper.board = readBoard();

                    $.ajax({
                        type: "POST",
                        url: "/sudokusolver/services/solve",
                        data: JSON.stringify(objWrapper),
                        contentType: 'application/json',
                        success: function(data) {
                            if (data == "") {
                                $("#msg").text("Invalid board.")
                            } else {
                                writeBoard(data);
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            //alert("Error, status = " + textStatus + ", " + "error thrown: " + errorThrown);
                        }
                    });
                });
            });

            function writeBoard(var data) {
                board = data; // this is redundant
                var cellNo = 0;
                for (var i = 0; i < 9; i++) {
                    for (var j = 0; j < 9; j++) {
                        $("#cell-" + cellNo.toString()).val(board[i][j].toString());
                        cellNo++;
                    }
                }
            }

            function readBoard() {
                var cellNo = 0;
                for (var i = 0; i < 9; i++) {
                    for (var j = 0; j < 9; j++) {
                        var value = $("#cell-" + cellNo.toString()).val();
                        if (value == "") {
                            value = "0"
                        }
                        board[i][j] = parseInt(value, 10);
                        cellNo++;
                    }
                }
                return board // this is redundant
            }

        </script>
    </head>

    <body>

        <div class="container">

            <h1>Sudoku Solver</h1>

            <table id="grid">

                <tr>
                    <td><input class="top left" id="cell-0" type="text" value="5" disabled></td>
                    <td><input class="top" id="cell-1" type="text" value="3" disabled></td>
                    <td><input class="top right" id="cell-2" type="text"></td>

                    <td><input class="top left" id="cell-3" type="text"></td>
                    <td><input class="top" id="cell-4" type="text" value="7" disabled></td>
                    <td><input class="top right" id="cell-5" type="text"></td>

                    <td><input class="top left" id="cell-6" type="text"></td>
                    <td><input class="top" id="cell-7" type="text"></td>
                    <td><input class="top right" id="cell-8" type="text"></td>
                </tr>

                <tr>
                    <td><input class="left" id="cell-9" type="text" value="6" disabled></td>
                    <td><input class="" id="cell-10" type="text"></td>
                    <td><input class="right" id="cell-11" type="text"></td>

                    <td><input class="left" id="cell-12" type="text" value="1" disabled></td>
                    <td><input class="" id="cell-13" type="text" value="9" disabled></td>
                    <td><input class="right" id="cell-14" type="text" value="5" disabled></td>

                    <td><input class="left" id="cell-15" type="text"></td>
                    <td><input class="" id="cell-16" type="text"></td>
                    <td><input class="right" id="cell-17" type="text"></td>
                </tr>

                <tr>
                    <td><input class="bottom left" id="cell-18" type="text"></td>
                    <td><input class="bottom" id="cell-19" type="text" value="9" disabled></td>
                    <td><input class="right bottom" id="cell-20" type="text" value="8" disabled></td>

                    <td><input class="bottom left" id="cell-21" type="text"></td>
                    <td><input class="bottom" id="cell-22" type="text"></td>
                    <td><input class="right bottom" id="cell-23" type="text"></td>

                    <td><input class="bottom left" id="cell-24" type="text"></td>
                    <td><input class="bottom" id="cell-25" type="text" value="6" disabled></td>
                    <td><input class="right bottom" id="cell-26" type="text"></td>
                </tr>

                <tr>
                    <td><input class="top left" id="cell-27" type="text" value="8" disabled></td>
                    <td><input class="top" id="cell-28" type="text"></td>
                    <td><input class="top right" id="cell-29" type="text"></td>

                    <td><input class="top left" id="cell-30" type="text"></td>
                    <td><input class="top" id="cell-31" type="text" value="6" disabled></td>
                    <td><input class="top right" id="cell-32" type="text"></td>

                    <td><input class="top left" id="cell-33" type="text"></td>
                    <td><input class="top" id="cell-34" type="text"></td>
                    <td><input class="top right" id="cell-35" type="text" value="3" disabled></td>
                </tr>

                <tr>
                    <td><input class="left" id="cell-36" type="text" value="4" disabled></td>
                    <td><input class="" id="cell-37" type="text"></td>
                    <td><input class="right" id="cell-38" type="text"></td>

                    <td><input class="left" id="cell-39" type="text" value="8" disabled></td>
                    <td><input class="" id="cell-40" type="text"></td>
                    <td><input class="right" id="cell-41" type="text" value="3" disabled></td>

                    <td><input class="left" id="cell-42" type="text"></td>
                    <td><input class="" id="cell-43" type="text"></td>
                    <td><input class="right" id="cell-44" type="text" value="1" disabled></td>
                </tr>

                <tr>
                    <td><input class="bottom left" id="cell-45" type="text" value="7" disabled></td>
                    <td><input class="bottom" id="cell-46" type="text"></td>
                    <td><input class="right bottom" id="cell-47" type="text"></td>

                    <td><input class="bottom left" id="cell-48" type="text"></td>
                    <td><input class="bottom" id="cell-49" type="text" value="2" disabled></td>
                    <td><input class="right bottom" id="cell-50" type="text"></td>

                    <td><input class="bottom left" id="cell-51" type="text"></td>
                    <td><input class="bottom" id="cell-52" type="text"></td>
                    <td><input class="right bottom" id="cell-53" type="text" value="6" disabled></td>
                </tr>

                <tr>
                    <td><input class="top left" id="cell-54" type="text"></td>
                    <td><input class="top" id="cell-55" type="text" value="6" disabled></td>
                    <td><input class="top right" id="cell-56" type="text"></td>

                    <td><input class="top left" id="cell-57" type="text"></td>
                    <td><input class="top" id="cell-58" type="text"></td>
                    <td><input class="top right" id="cell-59" type="text"></td>

                    <td><input class="top left" id="cell-60" type="text" value="2" disabled></td>
                    <td><input class="top" id="cell-61" type="text" value="8" disabled></td>
                    <td><input class="top right" id="cell-62" type="text"></td>
                </tr>

                <tr>
                    <td><input class="left" id="cell-63" type="text"></td>
                    <td><input class="" id="cell-64" type="text"></td>
                    <td><input class="right" id="cell-65" type="text"></td>

                    <td><input class="left" id="cell-66" type="text" value="4" disabled></td>
                    <td><input class="" id="cell-67" type="text" value="1" disabled></td>
                    <td><input class="right" id="cell-68" type="text" value="9" disabled></td>

                    <td><input class="left" id="cell-69" type="text"></td>
                    <td><input class="" id="cell-70" type="text"></td>
                    <td><input class="right" id="cell-71" type="text" value="5" disabled></td>
                </tr>

                <tr>
                    <td><input class="bottom left" id="cell-72" type="text"></td>
                    <td><input class="bottom" id="cell-73" type="text"></td>
                    <td><input class="right bottom " id="cell-74" type="text"></td>

                    <td><input class="bottom left" id="cell-75" type="text"></td>
                    <td><input class="bottom" id="cell-76" type="text" value="8" disabled></td>
                    <td><input class="right bottom" id="cell-77" type="text"></td>

                    <td><input class="bottom left" id="cell-78" type="text"></td>
                    <td><input class="bottom" id="cell-79" type="text" value="7" disabled></td>
                    <td><input class="right bottom" id="cell-80" type="text" value="9" disabled></td>
                </tr>

            </table>
            <button id="solvebtn">Solve</button>
            <p id="msg"></p>
        </div>
    </body>

    </html>
