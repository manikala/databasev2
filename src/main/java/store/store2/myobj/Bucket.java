package store.store2.myobj;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "buckets")
public class Bucket {
    private static final String SEQ_NAME = "bucket_seq";

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = SEQ_NAME)
    @SequenceGenerator(name = SEQ_NAME, sequenceName = SEQ_NAME, allocationSize = 1)
    private int id;
    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
    private double sum;
    @ManyToMany
    @JoinTable(name = "buckets_products",
        joinColumns = @JoinColumn(name = "backet_id"),
        inverseJoinColumns = @JoinColumn(name = "product_id"))
    private List<Product> product;

}
