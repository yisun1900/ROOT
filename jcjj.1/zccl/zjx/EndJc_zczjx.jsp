<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=request.getParameter("ddbh");
String zjxbh=request.getParameter("zjxbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String clzt=null;
	String fgsbh=null;
	ls_sql =" select clzt,fgsbh";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ�����������");
		return;
	}

	int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jcddblxs=rs.getInt(1);
		jcddmxblxs=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
		return;
	}


	String sxhtsfysh=null;//M������д��ͬ��Y������ˣ�N��δ���
	int count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_zczjxmx";
	ls_sql+=" where zjxbh='"+zjxbh+"' "; 
    ls_sql+=" and jc_zczjxmx.lx='2' and jc_zczjxmx.sxbz='2'";//1������д��2����д
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		sxhtsfysh="N";
	}
	else{
		sxhtsfysh="M";
	}


	count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_zczjxmx";
	ls_sql+=" where zjxbh='"+zjxbh+"' and zjsl=0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR>�����еĵ�Ʒδ¼��������");
		return;
	}

	String xinghao=null;
	double zdxsj=0;
	double dj=0;
	count=0;
	ls_sql =" select jc_zcddmx.xinghao,jc_zcddmx.zdxsj,jc_zcddmx.dj";
	ls_sql+=" from jc_zczjxmx,jc_zcddmx";
	ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh";
	ls_sql+=" and jc_zcddmx.ddbh='"+ddbh+"'";
	ls_sql+=" and jc_zczjxmx.zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xinghao=rs.getString("xinghao");
		zdxsj=rs.getDouble("zdxsj");
		dj=rs.getDouble("dj");

		if (zdxsj>dj)
		{
			out.println("<BR>���󣡡��ͺ�:"+xinghao+"���ġ�����:"+dj+"��С�ڡ���������޼�:"+zdxsj+"��");
			count++;
		}

	}
	rs.close();
	ps.close();

	if (count>0)
	{
		return;
	}

	conn.setAutoCommit(false);

	//���ݽ�������������ۣ�����������������������������������ʼ
	String getxh=null;
	ls_sql =" select xh ";
	ls_sql+=" from jc_zczjxmx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ls_sql+=" and lx='2'";//1��������Ŀ��2��������Ŀ
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getxh=rs.getString("xh");

		ls_sql="update jc_zcddmx set cbj=jsbl/100*dj";
		ls_sql+=" where  ddbh='"+ddbh+"' and xh="+getxh;
		ls_sql+=" and jsfs='2'";//1������ۣ�2���������
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	//��С��λ����
	ls_sql="update jc_zczjxmx ";
	ls_sql+=" set zjje=ROUND(zjje,"+jcddmxblxs+")";
	ls_sql+=" ,zjycf=ROUND(zjycf,"+jcddmxblxs+")";
	ls_sql+=" ,zjqtfy=ROUND(zjqtfy,"+jcddmxblxs+")";
	ls_sql+=" ,zjcxhdje=ROUND(zjcxhdje,"+jcddmxblxs+")";
	ls_sql+=",zjcbje=jc_zczjxmx.zjsl*(select jc_zcddmx.cbj from jc_zcddmx where jc_zcddmx.xh=jc_zczjxmx.xh)";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���������jc_zczjx��:�������ܶ�
	double zqzjxze=0;
	double zhzjxze=0;
	double zjxcxhdje=0;
	double zjxcbze=0;
	double zqzjxclf=0;
	double zhzjxclf=0;
	double zjxycf=0;
	double zjxqtf=0;
	double zjxyjjrje=0;
	ls_sql="select sum(zqzjje+zjycf+zjqtfy),sum(zjje+zjycf+zjqtfy),sum(zjcxhdje),sum(zjcbje),sum(zqzjje),sum(zjje),sum(zjycf),sum(zjqtfy),sum(zjyjjrje) ";
	ls_sql+=" from jc_zczjxmx ";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqzjxze=rs.getDouble(1);
		zhzjxze=rs.getDouble(2);
		zjxcxhdje=rs.getDouble(3);
		zjxcbze=rs.getDouble(4);
		zqzjxclf=rs.getDouble(5);
		zhzjxclf=rs.getDouble(6);
		zjxycf=rs.getDouble(7);
		zjxqtf=rs.getDouble(8);
		zjxyjjrje=rs.getDouble(9);
	}
	rs.close();
	ps.close();

	double zsje=0;
	ls_sql="select sum(jc_zcddmx.zsdj*jc_zczjxmx.zjsl)";
	ls_sql+=" from jc_zczjxmx,jc_zcddmx ";
	ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh and jc_zczjxmx.zjxbh='"+zjxbh+"'";
	ls_sql+=" and jc_zcddmx.sfzp='Y' ";//Y����Ʒ��N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zsje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double zjxzkl=0;
	if (zqzjxclf==0)
	{
		zjxzkl=0;
	}
	else{
		zjxzkl=zhzjxclf*10/zqzjxclf;
	}

	ls_sql="update jc_zczjx set zjxzkl="+zjxzkl+",zqzjxze="+zqzjxze+",zjxze=ROUND("+zhzjxze+","+jcddblxs+") ";
	ls_sql+=" ,zjxcxhdje=ROUND("+zjxcxhdje+","+jcddblxs+"),zjxcbze="+zjxcbze+",clzt='01',sxhtsfysh='"+sxhtsfysh+"'";
	ls_sql+=" ,zqzjxclf="+zqzjxclf+",zhzjxclf="+zhzjxclf+",zjxycf="+zjxycf+",zjxqtf="+zjxqtf+",zsje="+zsje+",zjxyjjrje="+zjxyjjrje;
	ls_sql+=" where zjxbh='"+zjxbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcddmx";
	ls_sql+=" set zjhsl=sl+NVL((select sum(zjsl) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zqzjhje=zqje+NVL((select sum(zqzjje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhje=je+NVL((select sum(zjje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhycf=ycf+NVL((select sum(zjycf) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhqtfy=qtfyje+NVL((select sum(zjqtfy) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhcxhdje=cxhdje+NVL((select sum(zjcxhdje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhyjjrje=htyjjrje+round(yjjrbl/100*NVL((select sum(zjje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0),2)";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" and jc_zcddmx.xh in(select xh from jc_zczjxmx where zjxbh='"+zjxbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//��С��λ����
	ls_sql="update jc_zcddmx ";
	ls_sql+=" set zjhje=ROUND(zjhje,"+jcddmxblxs+")";
	ls_sql+=" ,zjhycf=ROUND(zjhycf,"+jcddmxblxs+")";
	ls_sql+=" ,zjhqtfy=ROUND(zjhqtfy,"+jcddmxblxs+")";
	ls_sql+=" ,zjhcxhdje=ROUND(zjhcxhdje,"+jcddmxblxs+")";
	ls_sql+=" where ddbh='"+ddbh+"'";
    ls_sql+=" and jc_zcddmx.xh in(select xh from jc_zczjxmx where zjxbh='"+zjxbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	//��С��λ����
	String getzcmc;
	String getxinghao;
	double getzjhycf=0;
	double getzjhqtfy=0;
	ls_sql="select zcmc,xinghao,zjhycf,zjhqtfy";
	ls_sql+=" from jc_zcddmx ";
	ls_sql+=" where ddbh='"+ddbh+"' and zjhsl=0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzcmc=rs.getString("zcmc");
		getxinghao=rs.getString("xinghao");
		getzjhycf=rs.getDouble("zjhycf");
		getzjhqtfy=rs.getDouble("zjhqtfy");

		if (getzjhycf!=0)
		{
			conn.rollback();
			out.println("���󣡡�"+getzcmc+"���ͺš�"+getxinghao+"�������Ѽ�Ϊ0�����ǡ�������Զ�̷�:"+getzjhycf+"����Ϊ0");
			return;
		}
		if (getzjhqtfy!=0)
		{
			conn.rollback();
			out.println("���󣡡�"+getzcmc+"���ͺš�"+getxinghao+"�������Ѽ�Ϊ0�����ǡ���������������:"+getzjhqtfy+"����Ϊ0");
			return;
		}
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zcddmx ";
	ls_sql+=" set zqzjhje=0,zjhje=0,zjhycf=0,zjhqtfy=0,zjhcxhdje=0,zjhyjjrje=0";
	ls_sql+=" where ddbh='"+ddbh+"' and zjhsl=0";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���Ķ�����jc_zcdd��:�����������ܶ�
	double zqzjhze=0;
	double zjhze=0;
	zjxcbze=0;
	zjxcxhdje=0;

	zqzjxclf=0;
	zhzjxclf=0;
	zjxycf=0;
	zjxqtf=0;
	zsje=0;
	zjxyjjrje=0;
	ls_sql="select sum(zqzjxze),sum(zjxze),sum(zjxcbze),sum(zjxcxhdje)   ,sum(zqzjxclf),sum(zhzjxclf),sum(zjxycf),sum(zjxqtf),sum(zsje),sum(zjxyjjrje)";
	ls_sql+=" from jc_zczjx ";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqzjhze=rs.getDouble(1);
		zjhze=rs.getDouble(2);
		zjxcbze=rs.getDouble(3);
		zjxcxhdje=rs.getDouble(4);

		zqzjxclf=rs.getDouble(5);
		zhzjxclf=rs.getDouble(6);
		zjxycf=rs.getDouble(7);
		zjxqtf=rs.getDouble(8);
		zsje=rs.getDouble(9);
		zjxyjjrje=rs.getDouble(10);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zcdd set zqzjhze="+zqzjhze+",zjhze=ROUND("+zjhze+","+jcddblxs+")";
	ls_sql+=" ,zjxcxhdje=ROUND("+zjxcxhdje+","+jcddblxs+"),zjxcbze="+zjxcbze;
	ls_sql+=" ,zqzjxclf="+zqzjxclf+",zhzjxclf="+zhzjxclf+",zjxycf="+zjxycf+",zjxqtf="+zjxqtf+",zjxzsje="+zsje+",zjxyjjrje="+zjxyjjrje ;
	ls_sql+=" where ddbh='"+ddbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,zqje,zhje,cbje,fssj)";
	ls_sql+=" select zjxbh,'4','2',ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm,'',ppbm,gys,ppmc,zqzjxze,zjxze,zjxcbze,zjxfssj";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>