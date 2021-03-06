<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String shbz="";
	String sfwc="";
	String khbh=null;
	double zjxjme=10;
	double glfjmje=10;
	double sjjmje=10;
	ls_sql="select shbz,sfwc,khbh,zjxjme,glfjmje,sjjmje";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shbz=rs.getString("shbz");
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
		zjxjme=rs.getDouble("zjxjme");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("N") )//N：未完成；Y：完成
	{
		out.println("错误！增减项未完成，不能删除");
		return;
	}

	if ( shbz.equals("Y") || shbz.equals("S"))//N：未审核；Y：审核通过；S：审核未通过；M：不需审核
	{
		out.println("错误！增减项已审核，不能删除");
		return;
	}


	String newzjxxh="";
	String gcjdbm="";
	String gdjsjd="";
	String sjsjsbz="";
	ls_sql="select gcjdbm,zjxxh,gdjsjd,sjsjsbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//工程进度
		newzjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
	}
	rs.close();
	ps.close();

	if (gcjdbm.equals("5"))
	{
		out.println("错误！客户已完结，不能再删除");
		return;
	}
	if (sjsjsbz.equals("2"))//0：未结算；1：签单结算；2：完工结算
	{
		out.println("错误！设计师已结算，不能再删除");
		return;
	}
	if (gdjsjd.equals("1"))//0：未结算；1：已结算
	{
		out.println("错误！施工队已结算，不能再删除");
		return;
	}

	ls_sql="select zjxxh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";//N：未完成；Y：已完成
	ls_sql+=" and lx in('1','2')";//1：工程增减项；2：工程增减项无明细；3：套餐退补货；4：套餐调换产品
	ls_sql+=" order by zjxxh desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		newzjxxh=rs.getString(1);
	}
	rs.close();
	ps.close();

	if (!newzjxxh.equals(zjxxh))
	{
		out.println("错误！只能删除最新的增减项记录:"+newzjxxh);
		return;
	}

	conn.setAutoCommit(false);


	ls_sql="delete from crm_zjxtckhqye ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//增减项发生额
	ls_sql="update crm_zjxdj set zjje=0,jzjje=0,zqguanlif=0,zhguanlif=0,zqzjxsuijin=0,zjxsuijin=0";
	ls_sql+=" ,gczxzq=0,gcjxzq=0,gczxzh=0,gcjxzh=0,kglf=0,zjxrzf=0,zjxdjjje=0";
	ls_sql+=" ,zqzjze=0,zhzjze=0  ,zqqtsf=0,zhqtsf=0,qtsfsm=null  ,zqwjrqyexm=0,zhwjrqyexm=0,wjrqyexmsm=null,zqsjf=0,zhsjf=0";
	ls_sql+=" ,sfwc='N',shbz='M',zqtczjje=0,tczjje=0";//N：未审核；Y：审核；M：不需审核
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//不需审核，还原汇总信息
	if (shbz.equals("M"))//N：未审核；Y：审核通过；S：审核未通过；M：不需审核
	{
		//更新增减项汇总信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		double allzjxje=0;
		double alljzjje=0;
		double allzqzjxsuijin=0;
		double allzjxsuijin=0;
		double allzqguanlif=0;
		double allzhguanlif=0;
		double allkglf=0;
		double allkqtk=0;
		double allzjxrzf=0;
		double allzjxdjjje=0;

		double zqljzjx=0;
		double zhljzjx=0;
		double zqqtsfzjx=0;
		double zhqtsfzjx=0;
		double zqwjrzjx=0;
		double zhwjrzjx=0;
		double zqsjfzjx=0;
		double zhsjfzjx=0;
		
		ls_sql="select sum(zjje),sum(jzjje),sum(zqzjxsuijin),sum(zjxsuijin),sum(zqguanlif),sum(zhguanlif),sum(kglf),sum(kqtk),sum(zjxrzf)";
		ls_sql+=" ,sum(zqzjze),sum(zhzjze),sum(zqqtsf),sum(zhqtsf),sum(zqwjrqyexm),sum(zhwjrqyexm),sum(zqsjf),sum(zhsjf),sum(zjxdjjje)";
		ls_sql+=" from  crm_zjxdj";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfwc='Y'";//N：未完成；Y：已完成
		ls_sql+=" and (shbz='Y' OR shbz='M') ";//N：未审核；Y：审核通过；S：审核未通过；M：不需审核 
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			allzjxje=rs.getDouble(1);
			alljzjje=rs.getDouble(2);
			allzqzjxsuijin=rs.getDouble(3);
			allzjxsuijin=rs.getDouble(4);
			allzqguanlif=rs.getDouble(5);
			allzhguanlif=rs.getDouble(6);
			allkglf=rs.getDouble(7);
			allkqtk=rs.getDouble(8);
			allzjxrzf=rs.getDouble(9);

			zqljzjx=rs.getDouble(10);
			zhljzjx=rs.getDouble(11);
			zqqtsfzjx=rs.getDouble(12);
			zhqtsfzjx=rs.getDouble(13);
			zqwjrzjx=rs.getDouble(14);
			zhwjrzjx=rs.getDouble(15);
		
			zqsjfzjx=rs.getDouble(16);
			zhsjfzjx=rs.getDouble(17);
			allzjxdjjje=rs.getDouble(18);
		
		}
		rs.close();
		ps.close();


		ls_sql="update crm_khxx set zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
		ls_sql+=" ,zqljzjx=?,zhljzjx=?,zqqtsfzjx=?,zhqtsfzjx=?,zqwjrzjx=?,zhwjrzjx=?,zqsjfzjx=?,zhsjfzjx=?";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,allzjxje);
		ps.setDouble(2,alljzjje);
		ps.setDouble(3,allzqzjxsuijin);
		ps.setDouble(4,allzjxsuijin);
		ps.setDouble(5,allzqguanlif);
		ps.setDouble(6,allzhguanlif);
		ps.setDouble(7,allkglf);
		ps.setDouble(8,allkqtk);

		ps.setDouble(9,zqljzjx);
		ps.setDouble(10,zhljzjx);
		ps.setDouble(11,zqqtsfzjx);
		ps.setDouble(12,zhqtsfzjx);
		ps.setDouble(13,zqwjrzjx);
		ps.setDouble(14,zhwjrzjx);
		ps.setDouble(15,zqsjfzjx);
		ps.setDouble(16,zhsjfzjx);
		ps.executeUpdate();
		ps.close();


		//还原成本价等信息＋＋＋＋＋＋＋＋＋＋＋开始
		
		//取前一个增减项序号
		String oldzjxxh="";
		ls_sql="select zjxxh";
		ls_sql+=" from  crm_zjxdj";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ls_sql+=" and  zjxxh!='"+zjxxh+"'";
		ls_sql+=" order by  zjxxh desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			oldzjxxh=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();

		if (!oldzjxxh.equals(""))//有增减项，取前一个增减项成本价
		{
			//初始化
			dzbj.Zjx zjx=new dzbj.Zjx();

			double zxcbj=zjx.getCbj(conn,khbh,oldzjxxh,"yz");//成本价＝工程项成本价＋其它项成本（不含：管理费、税金）
			double zxgcjcbj=zjx.getGcjcbj(conn,khbh,oldzjxxh,"yz");//工程基础报价＝工程项工程基础报价＋其它项工程基础报价（不含：管理费、税金）
			double zxsgcbj=zjx.getSgcbj(conn,khbh,oldzjxxh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）

			double zxhtjz=zjx.getHtjz(conn,khbh,oldzjxxh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券
			double zxmle=cf.round(zxhtjz-zxsgcbj,2);//毛利额=合同净值－施工成本价
			double zxmll=cf.round(zxmle/zxhtjz*100,2);//毛利率＝毛利额÷合同净值

			double wjryjje=0;//未记入业绩项目
			ls_sql="SELECT sum(sfje)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+oldzjxxh+"' and sfjrqye='2'";
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				wjryjje=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			
			double yjjzcs=0;//业绩净值参数
			double mll=0;//合同毛利率
			ls_sql="SELECT yjjzcs,mll";
			ls_sql+=" FROM crm_khqye";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yjjzcs=rs.getDouble(1);
				mll=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			double zxyjjz=cf.round((zxmle-wjryjje)*100/yjjzcs,2);//业绩净值=毛利额÷核算净值参数

			ls_sql="update crm_khqye set zjxrzf=?,zjxdjjje=?,zxcbj=?,zxgcjcbj=?,zxsgcbj=?,zxhtjz=?,zxmle=?,zxmll=?,zxyjjz=?";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,allzjxrzf);
			ps.setDouble(2,allzjxdjjje);
			ps.setDouble(3,zxcbj);
			ps.setDouble(4,zxgcjcbj);
			ps.setDouble(5,zxsgcbj);
			ps.setDouble(6,zxhtjz);
			ps.setDouble(7,zxmle);
			ps.setDouble(8,zxmll);
			ps.setDouble(9,zxyjjz);
			ps.executeUpdate();
			ps.close();
		}
		else{//无增减项，最新成本价＝合同成本价
			ls_sql="update crm_khqye set zjxrzf=?,zjxdjjje=?,zxcbj=cbj,zxgcjcbj=gcjcbj,zxsgcbj=sgcbj,zxhtjz=htjz,zxmle=mle,zxmll=mll,zxyjjz=yjjz";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,allzjxrzf);
			ps.setDouble(2,allzjxdjjje);
			ps.executeUpdate();
			ps.close();
		}

		//还原成本价等信息＝＝＝＝＝＝＝＝＝＝＝结束

		ls_sql=" update cw_qmjzmx set zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,allzjxje);
		ps.setDouble(2,alljzjje);
		ps.setDouble(3,allzqzjxsuijin);
		ps.setDouble(4,allzjxsuijin);
		ps.setDouble(5,allzqguanlif);
		ps.setDouble(6,allzhguanlif);
		ps.setDouble(7,allkglf);
		ps.setDouble(8,allkqtk);
		ps.executeUpdate();
		ps.close();


		String bjjb = null;
		ls_sql="select bjjb";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bjjb=rs.getString("bjjb");
		}
		rs.close();
		ps.close();

		String lx="";
		ls_sql="select lx";
		ls_sql+=" from  bdm_bjjbbm";
		ls_sql+=" where bjjbbm='"+bjjb+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			lx=rs.getString("lx");
		}
		rs.close();
		ps.close();

		if (lx.equals("2"))//1：非套餐；2：套餐
		{
			double tcwsgzj=0;
			double tcwgccljj=0;
			double tcsgze=0;
			
			ls_sql="select sum(tcwsgzj),sum(tcwgccljj),sum(tcsgze) ";
			ls_sql+=" from  crm_zjxtckhqye,crm_zjxdj";
			ls_sql+=" where crm_zjxtckhqye.zjxxh=crm_zjxdj.zjxxh and crm_zjxtckhqye.khbh='"+khbh+"'";
			ls_sql+=" and crm_zjxdj.sfwc='Y'";//N：未完成；Y：已完成
			ls_sql+=" and (crm_zjxdj.shbz='Y' OR crm_zjxdj.shbz='M') ";//N：未审核；Y：审核通过；S：审核未通过；M：不需审核 
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				tcwsgzj=rs.getDouble(1);
				tcwgccljj=rs.getDouble(2);
				tcsgze=rs.getDouble(3);
			}
			rs.close();
			ps.close();

		
			ls_sql=" update crm_tckhqye set tcwsgzjzjx=?,tcwgccljjzjx=?,tcsgzezjx=? ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,tcwsgzj);
			ps.setDouble(2,tcwgccljj);
			ps.setDouble(3,tcsgze);
			ps.executeUpdate();
			ps.close();
		}
		
		
		//更新增减项汇总信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成
	}
	//还原汇总信息


	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>