package za.co.discovery.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import za.co.discovery.entity.Atm;

/**
 *
 * @author keneyfofeyin
 */
@Repository
public interface AtmRepository extends JpaRepository<Atm, Integer> {

	Optional<Atm> findByAtmId(@Param("atmId") Integer atmId);
}
