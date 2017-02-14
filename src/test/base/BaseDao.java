package test.base;

/**
 * Created by mh on 17-2-8.
 */



import java.util.List;


/**
 *
 * @author 羽中
 *
 * @param <T>
 */
public interface BaseDao<T> {
	/**
	 * 保存实体
	 * @param model
	 * @return 主键
	 */
	public Integer save(T model);

	/**
	 *
	 * @param model
	 */
	public void update(T model);

	/**
	 *
	 * @param model
	 */
	public void saveOrUpdate(T model);

	/**
	 *
	 * @param id
	 * @return
	 */
	public T getById(Integer id);

	/**
	 *
	 * @param ids
	 * @return
	 */
	public List<T> getByIds(Integer[] ids);

	/**
	 * 物理删除，通过主键Id直接删除数据
	 * @param id
	 */
	public void deleteById(Integer id);

	/**
	 * 物理删除，通过实体模型直接删除数据
	 * @param model
	 */
	public void delete(T model);




}
