<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010101")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>
<%

String ls=null;
String dwbh=null;
String dwmc=null;
String dwjc=null;
String dwlx=null;
String dwdz=null;
String dwfzr=null;
String dwdh=null;
String dwcz=null;
String email=null;
String bz=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String ssdw=cf.GB2Uni(request.getParameter("ssdw"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String hthqz=cf.GB2Uni(request.getParameter("hthqz"));
String cxbz=cf.GB2Uni(request.getParameter("cxbz"));
dwmc=cf.GB2Uni(request.getParameter("dwmc"));
dwjc=cf.GB2Uni(request.getParameter("dwjc"));
dwlx=cf.GB2Uni(request.getParameter("dwlx"));
dwdz=cf.GB2Uni(request.getParameter("dwdz"));
dwfzr=cf.GB2Uni(request.getParameter("dwfzr"));
dwdh=cf.GB2Uni(request.getParameter("dwdh"));
dwcz=cf.GB2Uni(request.getParameter("dwcz"));
email=cf.GB2Uni(request.getParameter("email"));
bz=cf.GB2Uni(request.getParameter("bz"));
String bianma=cf.GB2Uni(request.getParameter("bianma"));

String ssdqbm=cf.GB2Uni(request.getParameter("ssdqbm"));
String dwflbm=cf.GB2Uni(request.getParameter("dwflbm"));
String ssfw=cf.GB2Uni(request.getParameter("ssfw"));
String dwjb=cf.GB2Uni(request.getParameter("dwjb"));
String dzbjbz=cf.GB2Uni(request.getParameter("dzbjbz"));
String dmxs=cf.GB2Uni(request.getParameter("dmxs"));

java.sql.Date kdsj=null;
java.sql.Date gdsj=null;
ls=request.getParameter("kdsj");
try{
	if (!(ls.equals("")))  kdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kdsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gdsj");
try{
	if (!(ls.equals("")))  gdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gdsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ص�ʱ��]����ת����������:"+e);
	return;
}
int bzrs=0;
ls=request.getParameter("bzrs");
try{
	if (!(ls.equals("")))  bzrs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bzrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[��׼����]����ת����������:"+e);
	return;
}

String kfdh=cf.GB2Uni(request.getParameter("kfdh"));
String sfjms=cf.GB2Uni(request.getParameter("sfjms"));
String xuhao=cf.GB2Uni(request.getParameter("xuhao"));
String dhqh=cf.GB2Uni(request.getParameter("dhqh"));




Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (dwbh.length()!=5)
	{
		out.println("����[��λ���]���ȱ���5λ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="delete from bj_dzbjbz";
	ls_sql+=" where dwbh='"+dwbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into sq_dwxx ( dwbh,dwmc,dwjc,dwlx,dwdz,dwfzr,dwdh,dwcz,email,ssdw ";
	ls_sql+=" ,dqbm,hthqz,cxbz,ssfgs,bianma,ssdqbm,dwflbm,ssfw,dwjb,kdsj ";
	ls_sql+=" ,gdsj,dmxs,bzrs,kfdh,sfjms,xuhao,dhqh,bz,khxxglsj,jcppbz ";

	ls_sql+=" ,zxkhlrjc,zxkhlrts,qdkhbljc,qdkhblts,dzbjjc,hfsjzdsz,xmzyglbz,jjgwglbz,jjsjsglbz,jcddblxs ";
	ls_sql+=" ,jcddmxblxs,djlrfs,kgcxhdbl,zcmmbz,mmbz,cgjjbz,jjbz,bzlybl,lyblxx,lyblsx ";
	ls_sql+=" ,jryjbfb,sjjryjbfb,gcjcbjxs,sgcbbjxs,zdyxmshbz,zdyxmyxq,clfbfb,sfqyyssh,bjdysq )";

	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,UPPER(?),?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?  ";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);

	ps.setString(1,dwbh);
	ps.setString(2,dwmc);
	ps.setString(3,dwjc);
	ps.setString(4,dwlx);
	ps.setString(5,dwdz);
	ps.setString(6,dwfzr);
	ps.setString(7,dwdh);
	ps.setString(8,dwcz);
	ps.setString(9,email);
	ps.setString(10,ssdw);

	ps.setString(11,dqbm);
	ps.setString(12,hthqz);
	ps.setString(13,cxbz);
	ps.setString(14,ssfgs);
	ps.setString(15,bianma);
	ps.setString(16,ssdqbm);
	ps.setString(17,dwflbm);
	ps.setString(18,ssfw);
	ps.setString(19,dwjb);
	ps.setDate(20,kdsj);

	ps.setDate(21,gdsj);
	ps.setString(22,dmxs);
	ps.setInt(23,bzrs);
	ps.setString(24,kfdh);
	ps.setString(25,sfjms);
	ps.setString(26,xuhao);
	ps.setString(27,dhqh);
	ps.setString(28,bz);
	ps.setDate(29,null);//�ͻ���Ϣ����ʱ��
	ps.setString(30,"N");//Ͷ�߱��޹�Ӧ�̼��  Y���޶����޷�¼�룻N���޶�����¼��

	ps.setString(31,"N");//������ѯ�ͻ�¼����  N�������ã�Y������
	ps.setInt(32,0);//��ѯ�ͻ���ǰ¼������
	ps.setString(33,"N");//����ǩ���ͻ���¼��� N�������ã�Y������
	ps.setInt(34,0);//ǩ���ͻ���¼��������
	ps.setString(35,"7");//���õ��ӱ��ۼ��   7��[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]���ɸģ��ɸ������Ż�
	ps.setString(36,"1111");//���ûط�ʱ���Զ�����  1111
	ps.setString(37,"Y");//���ɶ�������ĿרԱ���˱�־  N�������ˣ�Y������
	ps.setString(38,"Y");//���ɶ����ԼҾӹ��ʹ��˱�־  N�������ˣ�Y������
	ps.setString(39,"Y");//���ɶ����ԼҾ����ʦ���˱�־  N�������ˣ�Y������
	ps.setString(40,"2");//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ

	ps.setString(41,"2");//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	ps.setString(42,"2");//���Ķ�������¼�뷽ʽ  1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
	ps.setString(43,"N");//���Ķ����Ƿ�ɸĴ��������  Y���ɸģ�N�����ɸ�
	ps.setString(44,"Y");//�����տ���  Y���޶��������տN���޶������տM���ɿ�
	ps.setString(45,"Y");//ľ���տ��� Y���޶��������տN���޶������տM���ɿ�
	ps.setString(46,"Y");//�����տ���  Y���޶��������տN���޶������տM���ɿ�
	ps.setString(47,"Y");//�Ҿ��տ���  Y���޶��������տN���޶������տM���ɿ�
	ps.setDouble(48,0);//��׼���ñ���
	ps.setDouble(49,0);//���ñ�������
	ps.setDouble(50,0);//���ñ�������

	ps.setDouble(51,0);//��װ�ͻ�����ҵ���տ����
	ps.setDouble(52,0);//��ƿͻ�����ҵ���տ����
	ps.setDouble(53,1);//���̻�������ϵ��
	ps.setDouble(54,1);//ʩ���ɱ�����ϵ��
	ps.setString(55,"N");//�Ƿ������Զ��������  Y�����ã�N��������
	ps.setInt(56,3);//�Զ�����Ŀ��Ч��,����Ϊ��λ
	ps.setDouble(57,31);//���ӱ��۲��ϷѰٷֱ�
	ps.setString(58,"N");//�Ƿ�����Ԥ�����  Y�����ã�N��������
	ps.setString(59,"1");//���۴�ӡ�Ƿ�����Ȩ  1��������Ȩ��2��ֻ��һ����Ȩ��3��ÿ�δ�ӡ������Ȩ
	
	ps.executeUpdate();
	ps.close();


	ls_sql="update sq_dwxx set ssdqbm=?,dqbm=?";
	ls_sql+=" where ssfgs='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssdqbm);
	ps.setString(2,dqbm);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>