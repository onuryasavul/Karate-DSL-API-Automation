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
            tagsScenario.injectOpen(rampUsers(20).during(10))
        )
        .protocols(KarateDsl.karateProtocol())
        .assertions(
            // ✅ Zero tolerance for failures
            global().failedRequests().count().is(0L),

            // ✅ Failure rate safety net (catches edge cases)
            global().failedRequests().percent().lt(1.0),

            // ✅ Typical user experience (median)
            global().responseTime().percentile(50).lt(200),

            // ✅ SLA boundary — the most important threshold
            global().responseTime().percentile(95).lt(250),

            // ✅ Worst-case users should still get a response
            global().responseTime().percentile(99).lt(5000),

            // ✅ No single request should hang forever
            global().responseTime().max().lt(10000),

            // ✅ Ensure the system is actually handling load
            global().requestsPerSec().gt(5.0)
        );
    }
}
