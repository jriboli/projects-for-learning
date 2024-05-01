package com.populateDB.factories;

import com.populateDB.models.Kill;
import com.populateDB.models.Match;
import com.populateDB.models.Player;
import com.populateDB.service.HelldiverWrapperService;

import java.util.List;
import java.util.Random;

public class KillFactory {

    private static final HelldiverWrapperService service = new HelldiverWrapperService();
    public static Kill createKill(Player player, Match match) {

        String enemy = chooseEnemy(match.getEnemyType());
        String weapon = match.getWeapons();
        String timeStamp = chooseTimeStamp();
        // TBD
        return Kill.builder()
                .enemy(enemy)
                .weapon(weapon)
                .timeOfKill(timeStamp)
                .build();
    }

    private static String chooseEnemy(String enemyType) {
        List<String> enemies = service.getEnemies(enemyType);
        Random random = new Random();
        int randomNumber = random.nextInt(enemies.size());
        return enemies.get(randomNumber);
    }

    private static String chooseTimeStamp() {
        Random random = new Random();
        int randomNumber = random.nextInt(1, 900000);
        return String.valueOf(randomNumber);
    }
}
