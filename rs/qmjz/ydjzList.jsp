<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<HTML><HEAD>
<TITLE>��ĩ��ת</TITLE>
<BODY bgColor=#ffffff>

<% 

String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String nian=cf.GB2Uni(request.getParameter("nian"));
String yue=cf.GB2Uni(request.getParameter("yue"));
String jzph=dwbh+nian+yue;

String wherejzrq=cf.lastDay(nian,yue);


java.sql.Date jzrq=java.sql.Date.valueOf(wherejzrq);
if (jzrq.compareTo(cf.getDate())>0)
{
	out.println("ʧ�ܣ�[��ת����]���ܴ���[ϵͳ����]!");
	return;
}

Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;

String ls_sql=null;



try {
	conn=cf.getConnection();


	//���أ� -1:����;0:�����ѽ�ת��1:�����ѽ�ת������δ��ת;2:����δ��ת 
	int count=cf.checkQmjz("rs_ydjz",wherejzrq);

	if (count==0)//�ѽ�ת
	{
		out.println("ʧ�ܣ����ڡ�"+wherejzrq+"���ѽ�ת��");
		return;
	}
	else if (count==2)//����û��ת
	{
		out.println("ʧ�ܣ������»�û�н�ת�����ܿ��½�ת��");
		return;
	}
	else if (count==-1)
	{
		out.println("ϵͳ����");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql="insert into rs_ydjz ( jzph,dwbh,sqjzrq,jzrq,jzr ) ";
	ls_sql+=" values ( ?,?,TRUNC(LAST_DAY(ADD_MONTHS(TO_DATE('"+jzrq+"','YYYY-MM-DD'),-1))),?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jzph);
	ps.setString(2,dwbh);
	ps.setDate(3,jzrq);
	ps.setString(4,yhmc);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into rs_yhxxqmjz (jzph,ygbh,jzrq,bianhao,yhmc,xb,csrq,sfzszg,mz,sg,tz,xx,hf,zzmm,sjsjb,zcmc,zzzs,zyzzzs,zsfl,zsjb,xlbm,zy,cjgzsj,xuewei,byyx,zz,yzbm,dh,bgdh,jtdh,email,sfzh,sfzdz,gznx,jjlxr,jjlxrdz,lxrdh,zwbm,xzzwbm,sfytj,tjrq,sfqs,dhsfgb,zwpj,sftlgx,ssfgs,dwbh,sjsbh,lrr,lrsj,bz,bdxh,rzxh,rzsj,rzcs,syjzrq,sfydbs,qgzdw,wgzsj,gqpxkssj,gqpxjssj,zzxh,zzrq,zzpzbm,lzxh,lzrq,lzyyflbm,lzyy,kqhm,ldhtbh,ldhtlx,ldhtqx,htksrq,htdqrq,hjszd,dacfd,dazrsj,dazcsj,dazchc,dabgfjs,zkl,ckjgbz,zdyhbz,kdlxtbz,bjjb,kkbbz,yhdlm,yhkl,yhjs,sjxzbz,sbsj,xbsj,ipxzbz,ipdz,wkxzbz,wkdz,khdhbz,kkglfx,lxdlsbcs,mmxgsj,sccgdlsj,mmsyzq,yxdlsbcs,bsxtsmmzq,kfgssq) ";
	ls_sql+=" select ?,ygbh,?,bianhao,yhmc,xb,csrq,sfzszg,mz,sg,tz,xx,hf,zzmm,sjsjb,zcmc,zzzs,zyzzzs,zsfl,zsjb,xlbm,zy,cjgzsj,xuewei,byyx,zz,yzbm,dh,bgdh,jtdh,email,sfzh,sfzdz,gznx,jjlxr,jjlxrdz,lxrdh,zwbm,xzzwbm,sfytj,tjrq,sfqs,dhsfgb,zwpj,sftlgx,ssfgs,dwbh,sjsbh,lrr,lrsj,bz,bdxh,rzxh,rzsj,rzcs,syjzrq,sfydbs,qgzdw,wgzsj,gqpxkssj,gqpxjssj,zzxh,zzrq,zzpzbm,lzxh,lzrq,lzyyflbm,lzyy,kqhm,ldhtbh,ldhtlx,ldhtqx,htksrq,htdqrq,hjszd,dacfd,dazrsj,dazcsj,dazchc,dabgfjs,zkl,ckjgbz,zdyhbz,kdlxtbz,bjjb,kkbbz,yhdlm,yhkl,yhjs,sjxzbz,sbsj,xbsj,ipxzbz,ipdz,wkxzbz,wkdz,khdhbz,kkglfx,lxdlsbcs,mmxgsj,sccgdlsj,mmsyzq,yxdlsbcs,bsxtsmmzq,kfgssq";
	ls_sql+=" from sq_yhxx ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jzph);
	ps.setDate(2,jzrq);
	ps.executeUpdate();
	ps.close();



	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("��ת�ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch(Exception e){
	conn.rollback();
	out.print("���ݿ����ʧ��"+e);
	out.print("ls_sql="+ls_sql);
}
finally{
	try{
		conn.setAutoCommit(true);

		if (rs!= null) rs.close();  
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);  
	}
	catch (Exception e){ 
		out.println("�ر����ӷ�������,Exception:"+e.getMessage()); 
	} 
}
%>  

</BODY>
</html>




