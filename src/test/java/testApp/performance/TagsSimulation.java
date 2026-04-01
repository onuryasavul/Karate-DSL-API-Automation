package testApp.performance;

import com.intuit.karate.gatling.javaapi.KarateDsl;
import io.gatling.javaapi.core.ScenarioBuilder;
import io.gatling.javaapi.core.Simulation;
import static io.gatling.javaapi.core.CoreDsl.*;

public class TagsSimulation extends Simulation {

    // Define the Scenario that calls our Karate feature
    ScenarioBuilder tagsScenario = scenario("Tags Performance Scenario")
            .exec(KarateDsl.karateFeature("classpath:testApp/performance/PerfTags.feature"));

    public TagsSimulation() {
        // Set up the load model: inject 10 users over 5 seconds
        setUp(
            tagsScenario.injectOpen(rampUsers(10).during(5))
        ).protocols(KarateDsl.karateProtocol());
    }
}
