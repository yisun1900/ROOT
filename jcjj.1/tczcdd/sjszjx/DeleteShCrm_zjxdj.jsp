<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxxh=request.getParameterValues("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxxh.length ;i++ )
	{
		String sfwc="";
		String getshbz="";
		String khbh=null;
		double zjxjme=10;
		double glfjmje=10;
		double sjjmje=10;

		double kqtk=10;
		ls_sql="select shbz,sfwc,khbh,zjxjme,glfjmje,sjjmje,kqtk";
		ls_sql+=" from  crm_zjxdj";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getshbz=cf.fillNull(rs.getString("shbz"));
			sfwc=rs.getString("sfwc");
			khbh=rs.getString("khbh");
			zjxjme=rs.getDouble("zjxjme");
			glfjmje=rs.getDouble("glfjmje");
			sjjmje=rs.getDouble("sjjmje");

			kqtk=rs.getDouble("kqtk");
		}
		rs.close();
		ps.close();

		if (sfwc.equals("N"))
		{
			conn.rollback();
			out.println("错误！调换产品未完成:"+zjxxh[i]);
			return;
		}
		if (!getshbz.equals("Y") && !getshbz.equals("S"))//N：未审核；Y：审核通过；S：审核未通过；M：不需审核
		{
			conn.rollback();
			out.println("错误！未审核:"+zjxxh[i]);
			return;
		}

		ls_sql="update crm_zjxdj set shbz='N',shr=null,shsj=null";//N：未审核；Y：审核通过；S：审核未通过；M：不需审核
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
 
		if (getshbz.equals("Y"))//审核通过，删除需还原汇总信息
		{
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


			//更新调换产品汇总信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
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

			//上次调换产品序号
			String oldzjxxh="";
			ls_sql="select zjxxh";
			ls_sql+=" from  crm_zjxdj";
			ls_sql+=" where khbh='"+khbh+"' and zjxxh!='"+zjxxh[i]+"'";
			ls_sql+=" and sfwc='Y'";//N：未完成；Y：已完成
			ls_sql+=" and (shbz='Y' OR shbz='M') ";//N：未审核；Y：审核通过；S：审核未通过；M：不需审核 
			ls_sql+=" order by zjxxh desc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				oldzjxxh=cf.fillNull(rs.getString("zjxxh"));
			}
			rs.close();
			ps.close();

			if (oldzjxxh.equals(""))//无调换产品，最新＝合同
			{
				ls_sql="update crm_khqye set zjxrzf=?,zjxdjjje=?,zxcbj=cbj,zxgcjcbj=gcjcbj,zxsgcbj=sgcbj,zxhtjz=htjz,zxmle=mle,zxmll=mll,zxyjjz=yjjz";
				ls_sql+=" where  khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,allzjxrzf);
				ps.setDouble(2,allzjxdjjje);
				ps.executeUpdate();
				ps.close();
			}
			else{
				//初始化
				dzbj.Zjx zjx=new dzbj.Zjx();
				double zxcbj=zjx.getCbj(conn,khbh,oldzjxxh,"yz");//成本价＝工程项成本价＋其它项成本（不含：管理费、税金）
				double zxgcjcbj=zjx.getGcjcbj(conn,khbh,oldzjxxh,"yz");//工程基础报价＝工程项工程基础报价＋其它项工程基础报价（不含：管理费、税金）

				double zxhtjz=zjx.getHtjz(conn,khbh,oldzjxxh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券
				double zxsgcbj=zjx.getSgcbj(conn,khbh,oldzjxxh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）
				double zxmle=cf.round(zxhtjz-zxsgcbj,2);//毛利额=合同净值－施工成本价
				double zxmll=cf.round(zxmle/zxhtjz*100,2);//毛利率＝毛利额÷合同净值

				double wjryjje=0;//未记入业绩项目
				ls_sql="SELECT sum(sfje)";
				ls_sql+=" FROM bj_sfxmmxh";
				ls_sql+=" where zjxxh='"+oldzjxxh+"' and sfjrqye='2'";
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


			if (lx.equals("2"))//1：非套餐；2：套餐
			{
				double tcbzjg=0;
				double tcmjzjje=0;
				double tczcsjcj=0;
				double tczccljj=0;
				double tcxsfzc=0;

				double tczcjm=0;
				double tcdpsj=0;
				double tcdpdlsf=0;
				double tcxpx=0;
				double tcwsgzj=0;
				double tcwgccljj=0;
				double tcwzjzc=0;
				double tcsgze=0;
				double tcqtsf=0;
				double zctcje=0;
				double wntcje=0;
				
				ls_sql="select sum(tcbzjg),sum(tcmjzjje),sum(tczcsjcj),sum(tczccljj),sum(tcxsfzc),sum(tczcjm),sum(tcdpsj),sum(tcdpdlsf),sum(tcxpx)";
				ls_sql+=" ,sum(tcwsgzj),sum(tcwgccljj),sum(tcwzjzc),sum(tcsgze),sum(tcqtsf),sum(zctcje),sum(wntcje) ";
				ls_sql+=" from  crm_zjxtckhqye,crm_zjxdj";
				ls_sql+=" where crm_zjxtckhqye.zjxxh=crm_zjxdj.zjxxh and crm_zjxtckhqye.khbh='"+khbh+"'";
				ls_sql+=" and crm_zjxdj.sfwc='Y'";//N：未完成；Y：已完成
				ls_sql+=" and (crm_zjxdj.shbz='Y' OR crm_zjxdj.shbz='M') ";//N：未审核；Y：审核通过；S：审核未通过；M：不需审核 
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					tcbzjg=rs.getDouble(1);
					tcmjzjje=rs.getDouble(2);
					tczcsjcj=rs.getDouble(3);
					tczccljj=rs.getDouble(4);
					tcxsfzc=rs.getDouble(5);
					tczcjm=rs.getDouble(6);
					tcdpsj=rs.getDouble(7);
					tcdpdlsf=rs.getDouble(8);
					tcxpx=rs.getDouble(9);

					tcwsgzj=rs.getDouble(10);
					tcwgccljj=rs.getDouble(11);
					tcwzjzc=rs.getDouble(12);
					tcsgze=rs.getDouble(13);
					tcqtsf=rs.getDouble(14);
					zctcje=rs.getDouble(15);
					wntcje=rs.getDouble(16);
				}
				rs.close();
				ps.close();
				
				ls_sql=" update crm_tckhqye set tcbzjgzjx=?,tcmjzjjezjx=?,tczcsjcjzjx=?,tczccljjzjx=?,tcxsfzczjx=?,tczcjmzjx=?,tcdpsjzjx=?,tcdpdlsfzjx=?,tcxpxzjx=?,tcwsgzjzjx=?,tcwgccljjzjx=?,tcwzjzczjx=?,tcsgzezjx=?,tcqtsfzjx=?,zctcjezjx=?,wntcjezjx=? ";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,tcbzjg);
				ps.setDouble(2,tcmjzjje);
				ps.setDouble(3,tczcsjcj);
				ps.setDouble(4,tczccljj);
				ps.setDouble(5,tcxsfzc);
				ps.setDouble(6,tczcjm);
				ps.setDouble(7,tcdpsj);
				ps.setDouble(8,tcdpdlsf);
				ps.setDouble(9,tcxpx);
				ps.setDouble(10,tcwsgzj);
				ps.setDouble(11,tcwgccljj);
				ps.setDouble(12,tcwzjzc);
				ps.setDouble(13,tcsgze);
				ps.setDouble(14,tcqtsf);
				ps.setDouble(15,zctcje);
				ps.setDouble(16,wntcje);
				ps.executeUpdate();
				ps.close();

				//初始化
				dzbj.Zjx zjx=new dzbj.Zjx();
				//删除－调换产品套餐主材订单分解
				zjx.DelZjxTcDdfj(conn,khbh,zjxxh[i],"yz");
			}
			
			
			//更新调换产品汇总信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成

		}
	}
	
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>