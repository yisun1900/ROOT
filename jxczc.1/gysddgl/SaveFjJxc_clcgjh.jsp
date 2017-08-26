<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");

String[] cgjhph = request.getParameterValues("cgjhph");
String cgjhphItem =cf.GB2Uni(cf.arrayToInSQL(cgjhph,"cgjhph"));


String clbm=null;
String dqbm=null;
String ppmc=null;
String gysmc=null;
String gysbm=null;
String gysbm5=null;
String lsph=null;

int csph=0;

String ddzt="0";//0���ȴ��µ���1���ȴ����ܣ�2���ѽ��գ�3���ѷ�����4���ѽ��㣻 
String cllb="0";//0�����ģ�1������
String cglb="J";//J�����Ųɹ���D���ط��ɹ�
int dhxh=0;
String clmc=null;
String xh=null;
String gg=null;
double dhsl=0;
double cbj=0;

String wherecgjhph=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<cgjhph.length ;i++ )
	{
		String jhdzt=null;
		String shjg=null;
		ls_sql="select jhdzt,shjg ";
		ls_sql+=" from  jxc_clcgjh ";
		ls_sql+=" where cgjhph='"+cgjhph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jhdzt=rs.getString("jhdzt");
			shjg=rs.getString("shjg");
		}
		rs.close();
		ps.close();

		if (!jhdzt.equals("2") || !shjg.equals("Y"))//0��δ�ύ��1���ȴ���ˣ�2�������ɣ�3���ѷֽ�ɶ�����5�����ڰ�����⣻9���ƻ����
		{
			conn.rollback();
			out.print("���󣡲ɹ��ƻ�["+cgjhph[i]+"]״̬����ȷ��");
			return;
		}
	}

	
	//��ѯ��������
	ls_sql="select dqbm ";
	ls_sql+=" from  jxc_clcgjh,sq_dwxx ";
	ls_sql+=" where "+cgjhphItem+" and jxc_clcgjh.ssfgs=sq_dwxx.dwbh and jhdzt='2'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


	ls_sql="select distinct gysmc ";
	ls_sql+=" from  jxc_cgjhmx ";
	ls_sql+=" where "+cgjhphItem ;
	ls_sql+=" order by gysmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		gysmc=cf.fillNull(rs.getString("gysmc"));



		//���ݹ�Ӧ�����Ʋ�����Ӧ�̱��
		ls_sql="select gysbm ";
		ls_sql+=" from  jxc_gysxx ";
		ls_sql+=" where gysmc='"+gysmc+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			gysbm=cf.fillNull(rs1.getString("gysbm"));
			gysbm5=cf.addZero(gysbm,5);
		}
		else
		{
			out.print("<font color=red>���󣡹�Ӧ��["+gysmc+"]�����ڣ�</font><br>");
			conn.rollback();
			return;
		}
		rs1.close();
		ps1.close();

		//���ɱ��
		String nian=cf.today("YY");
		String gysddph=null;
		int count=0;
		ls_sql="select NVL(max(substr(gysddph,10,4)),0)";
		ls_sql+=" from  jxc_gysdd";
		ls_sql+=" where ssfgs='"+ssfgs+"' and cglb='"+cglb+"' and nian='"+nian+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		gysddph="ZG"+ssfgs+nian+cf.addZero(count+1,4);

		//��д��Ӧ�̶���
		String lrr=(String)session.getAttribute("yhmc");
		String lrbm=(String)session.getAttribute("dwbh");
		ls_sql="insert into jxc_gysdd ( gysddph,ssfgs,dqbm,gysbm,gysmc,cglb,cllb,psfs,sgph,yqdhsj   ,sfrksgdw,lrr,lrsj,lrbm,nian,bz,fhsfwc,sfjs,ddzt,dhzsl,dhzje ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,SYSDATE,?,?,?,'N','N','0',0,0 ) ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,gysddph);
		ps1.setString(2,ssfgs);
		ps1.setString(3,dqbm);
		ps1.setString(4,gysbm);
		ps1.setString(5,gysmc);
		ps1.setString(6,cglb);
		ps1.setString(7,cllb);
		ps1.setString(8,"1");//1:���ͣ�2����ȡ��3������ 
		ps1.setString(9,"");
		ps1.setDate(10,null);

		ps1.setString(11,"N");//�Ƿ�ֱ������깺��˾ Y���ǣ�N����
		ps1.setString(12,lrr);
		ps1.setString(13,lrbm);
		ps1.setString(14,nian);
		ps1.setString(15,"���ݲɹ��ƻ���>���ɹ�Ӧ�̶���");
		ps1.executeUpdate();
		ps1.close();

		//��д�ɹ��ƻ��������ձ�
		ls_sql =" insert into jxc_cgjhddb(gysddph,cgjhph) ";
		ls_sql+=" select distinct '"+gysddph+"',cgjhph ";
		ls_sql+=" from  jxc_cgjhmx ";
		ls_sql+=" where "+cgjhphItem+" and gysmc='"+gysmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();


		//���ݹ�Ӧ�̡��ɹ��ƻ����� ������������ϸ����


		//��д��Ӧ�̶�����ϸ
		ls_sql =" insert into   jxc_gysddmx(gysddph,dhxh,clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm,cbj,dhsl,dhje,pssl) ";
		ls_sql+=" select '"+gysddph+"',rownum,clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm,jhcgdj,dhsl,jhcgdj*dhsl,0 ";
		ls_sql+=" from  (";
		ls_sql+=" select  jxc_cgjhmx.clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm,jhcgdj,sum(jhcgsl) dhsl ";
		ls_sql+=" from  jxc_cgjhmx";
		ls_sql+=" where "+cgjhphItem+" and gysmc='"+gysmc+"'";
		ls_sql+=" group by clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm,jhcgdj ";
		ls_sql+=" order by clbm";
		ls_sql+=" )";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();


		//�����ܽ��
		double dhzsl=0;
		double dhzje=0;
		ls_sql=" select sum(dhsl),sum(dhje) ";
		ls_sql+=" from jxc_gysddmx ";
		ls_sql+=" where gysddph='"+gysddph+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			dhzsl=rs1.getDouble(1);
			dhzje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		//�޸Ĳɹ��ƻ���״̬
		ls_sql="update jxc_gysdd set dhzsl="+dhzsl+",dhzje="+dhzje;
		ls_sql+=" where gysddph='"+gysddph+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	
	
	}
	rs.close();
	ps.close();

	//���²ɹ��ƻ���״̬
	ls_sql="update jxc_clcgjh set jhdzt='3' ";
	ls_sql+=" where "+cgjhphItem;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�ɹ��ƻ��ֽ�ɶ����ɹ�������[�Թ�Ӧ���¶���]�µ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


	
%>