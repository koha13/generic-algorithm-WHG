class Setting{
void setLv2Walls() {

  tiles[0][0].wall = true;
   tiles[0][1].wall = true;
   tiles[0][2].wall = true;
   tiles[0][3].wall = true;
   tiles[0][4].wall = true;
   tiles[0][5].wall = true;
   tiles[0][6].wall = true;
   tiles[0][7].wall = true;
   tiles[0][8].wall = true;
   tiles[0][9].wall = true;
   tiles[1][0].wall = true;
   tiles[1][1].wall = true;
   tiles[1][2].wall = true;
   tiles[1][3].wall = true;
   tiles[1][4].wall = true;
   tiles[1][5].wall = true;
   tiles[1][6].wall = true;
   tiles[1][7].wall = true;
   tiles[1][8].wall = true;
   tiles[1][9].wall = true;
   tiles[2][0].wall = true;
   tiles[2][1].wall = true;
   tiles[2][2].wall = true;
   tiles[2][3].wall = true;
   tiles[2][6].wall = true;
   tiles[2][7].wall = true;
   tiles[2][8].wall = true;
   tiles[2][9].wall = true;
   tiles[3][0].wall = true;
   tiles[3][1].wall = true;
   tiles[3][2].wall = true;
   tiles[3][3].wall = true;
   tiles[3][6].wall = true;
   tiles[3][7].wall = true;
   tiles[3][8].wall = true;
   tiles[3][9].wall = true;
   tiles[4][0].wall = true;
   tiles[4][1].wall = true;
   tiles[4][2].wall = true;
   tiles[4][3].wall = true;
   tiles[4][6].wall = true;
   tiles[4][7].wall = true;
   tiles[4][8].wall = true;
   tiles[4][9].wall = true;
   tiles[5][0].wall = true;
   tiles[5][1].wall = true;
   tiles[5][8].wall = true;
   tiles[5][9].wall = true;
   tiles[6][0].wall = true;
   tiles[6][1].wall = true;
   tiles[6][8].wall = true;
   tiles[6][9].wall = true;
   tiles[7][0].wall = true;
   tiles[7][1].wall = true;
   tiles[7][8].wall = true;
   tiles[7][9].wall = true;
   tiles[8][0].wall = true;
   tiles[8][1].wall = true;
   tiles[8][8].wall = true;
   tiles[8][9].wall = true;
   tiles[9][0].wall = true;
   tiles[9][1].wall = true;
   tiles[9][8].wall = true;
   tiles[9][9].wall = true;
   tiles[10][0].wall = true;
   tiles[10][1].wall = true;
   tiles[10][8].wall = true;
   tiles[10][9].wall = true;
   tiles[11][0].wall = true;
   tiles[11][1].wall = true;
   tiles[11][8].wall = true;
   tiles[11][9].wall = true;
   tiles[12][0].wall = true;
   tiles[12][1].wall = true;
   tiles[12][8].wall = true;
   tiles[12][9].wall = true;
   tiles[13][0].wall = true;
   tiles[13][1].wall = true;
   tiles[13][8].wall = true;
   tiles[13][9].wall = true;
   tiles[14][0].wall = true;
   tiles[14][1].wall = true;
   tiles[14][8].wall = true;
   tiles[14][9].wall = true;
   tiles[15][0].wall = true;
   tiles[15][1].wall = true;
   tiles[15][8].wall = true;
   tiles[15][9].wall = true;
   tiles[16][0].wall = true;
   tiles[16][1].wall = true;
   tiles[16][8].wall = true;
   tiles[16][9].wall = true;
   tiles[17][0].wall = true;
   tiles[17][1].wall = true;
   tiles[17][2].wall = true;
   tiles[17][3].wall = true;
   tiles[17][6].wall = true;
   tiles[17][7].wall = true;
   tiles[17][8].wall = true;
   tiles[17][9].wall = true;
   tiles[18][0].wall = true;
   tiles[18][1].wall = true;
   tiles[18][2].wall = true;
   tiles[18][3].wall = true;
   tiles[18][6].wall = true;
   tiles[18][7].wall = true;
   tiles[18][8].wall = true;
   tiles[18][9].wall = true;
   tiles[19][0].wall = true;
   tiles[19][1].wall = true;
   tiles[19][2].wall = true;
   tiles[19][3].wall = true;
   tiles[19][6].wall = true;
   tiles[19][7].wall = true;
   tiles[19][8].wall = true;
   tiles[19][9].wall = true;
   tiles[20][0].wall = true;
   tiles[20][1].wall = true;
   tiles[20][2].wall = true;
   tiles[20][3].wall = true;
   tiles[20][4].wall = true;
   tiles[20][5].wall = true;
   tiles[20][6].wall = true;
   tiles[20][7].wall = true;
   tiles[20][8].wall = true;
   tiles[20][9].wall = true;
   tiles[21][0].wall = true;
   tiles[21][1].wall = true;
   tiles[21][2].wall = true;
   tiles[21][3].wall = true;
   tiles[21][4].wall = true;
   tiles[21][5].wall = true;
   tiles[21][6].wall = true;
   tiles[21][7].wall = true;
   tiles[21][8].wall = true;
   tiles[21][9].wall = true;
}


void setLv2Goal() {
  tiles[17][4].goal = true;
  tiles[17][5].goal = true;
  tiles[18][4].goal = true;
  tiles[18][5].goal = true;
  tiles[19][4].goal = true;
  tiles[19][5].goal = true;
}

void setLv2SafeZone() {
  tiles[2][4].safezone = true;
   tiles[2][5].safezone = true;
   tiles[3][4].safezone = true;
   tiles[3][5].safezone = true;
   tiles[4][4].safezone = true;
   tiles[4][5].safezone = true;
}



void setEdges() {
  for (int i = 1; i< 21; i++) {
    for (int j = 1; j< 9; j++) {
      if (tiles[i][j].wall) {
        if (!tiles[i+1][j].wall) {
          tiles[i][j].edges.append(1);
        }
        if (!tiles[i][j+1].wall) {
          tiles[i][j].edges.append(2);
        }
        if (!tiles[i-1][j].wall) {
          tiles[i][j].edges.append(3);
        }
        if (!tiles[i][j-1].wall) {
          tiles[i][j].edges.append(4);
        }
      }
    }
  }
}


void setDots() {
   dots[0] = new Dot(tiles[5][2],tiles[5][7], 0, 1);
   dots[1] =new Dot(tiles[6][7],tiles[6][2], 0, -1);
   dots[2]=new Dot(tiles[7][2],tiles[7][7], 0, 1);
   dots[3]=new Dot(tiles[8][7],tiles[8][2], 0, -1);
   dots[4]=new Dot(tiles[9][2],tiles[9][7], 0, 1);
   dots[5]=new Dot(tiles[10][7],tiles[10][2], 0, -1);
   dots[6]=new Dot(tiles[11][2],tiles[11][7], 0, 1);
   dots[7]=new Dot(tiles[12][7],tiles[12][2], 0, -1);
   dots[8]=new Dot(tiles[13][2],tiles[13][7], 0, 1);
   dots[9]=new Dot(tiles[14][7],tiles[14][2], 0, -1);
   dots[10]=new Dot(tiles[15][2],tiles[15][7], 0, 1);
   dots[11]=new Dot(tiles[16][7],tiles[16][2], 0, -1);
}


void setSolids() {
   solids.add(new Solid(tiles[1][6],tiles[4][8]));
   solids.add(new Solid(tiles[4][8],tiles[17][8]));
   solids.add(new Solid(tiles[17][6],tiles[20][8]));
   solids.add(new Solid(tiles[20][3],tiles[20][6]));
   solids.add(new Solid(tiles[17][1],tiles[20][3]));
   solids.add(new Solid(tiles[4][1],tiles[17][1]));
   solids.add(new Solid(tiles[1][1],tiles[4][3]));
   solids.add(new Solid(tiles[1][3],tiles[1][6]));
}
}
