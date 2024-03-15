package domain;

import java.util.Optional;

/**
 * Candidate
 */
public record Candidate(
    String id,
    Optional<String> photo,
    String givenName,
    String familyName,
    String email,
    Optional<String> phone,
    Optional<String> jobTitle) {
}
