<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jc_zcjgb_zcbm=null;
	String jc_zcjgb_zcmc=null;
	String zcdlbm=null;
	String jc_zcjgb_xh=null;
	String jc_zcjgb_gg=null;
	String jc_zcjgb_lsj=null;
	String jc_zcjgb_yhj=null;
	String jc_zcjgb_zp=null;
	String zclbbm=null;
	String jc_zcjgb_zcysbm=null;
	String jc_zcjgb_jldwbm=null;
	String jc_zcjgb_sfbhpj=null;
	String jc_zcjgb_pjts=null;

	String sftjcp=null;
	sftjcp=request.getParameter("sftjcp");
	if (sftjcp!=null)
	{
		sftjcp=cf.GB2Uni(sftjcp);
		if (!(sftjcp.equals("")))	wheresql+=" and  (jc_zcjgb.sftjcp='"+sftjcp+"')";
	}

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
//		if (!(lrbm.equals("")))	wheresql+=" and  (jc_zcjgb.lrbm='"+lrbm+"')";
	}

	String xhlist[]=request.getParameterValues("xhlist");
	jc_zcjgb_xh=request.getParameter("jc_zcjgb_xh");

	String mhcx=request.getParameter("mhcx");
	if (mhcx.equals("Y"))
	{
		if (xhlist!=null)
		{
			String lsxh="";
			String getxh="";
			for (int i=0;i<xhlist.length ;i++ )
			{
				getxh=cf.GB2Uni(xhlist[i]);
				lsxh+=" or (jc_zcjgb.xh like '%"+getxh+"%')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (jc_zcjgb_xh!=null)
			{
				jc_zcjgb_xh=cf.GB2Uni(jc_zcjgb_xh);
				if (!(jc_zcjgb_xh.equals("")))	wheresql+=" and  (jc_zcjgb.xh like '%"+jc_zcjgb_xh+"%')";
			}
		}
	}
	else{
		if (xhlist!=null)
		{
			String lsxh="";
			String getxh="";
			for (int i=0;i<xhlist.length ;i++ )
			{
				getxh=cf.GB2Uni(xhlist[i]);
				lsxh+=" or (jc_zcjgb.xh='"+getxh+"')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (jc_zcjgb_xh!=null)
			{
				jc_zcjgb_xh=cf.GB2Uni(jc_zcjgb_xh);
				if (!(jc_zcjgb_xh.equals("")))	wheresql+=" and  (jc_zcjgb.xh='"+jc_zcjgb_xh+"')";
			}
		}
	}


	String cxhdbl=null;
	cxhdbl=request.getParameter("cxhdbl");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jc_zcjgb.cxhdbl>="+cxhdbl+")";
	}
	cxhdbl=request.getParameter("cxhdbl2");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jc_zcjgb.cxhdbl<="+cxhdbl+")";
	}

	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_zcjgb.dqbm='"+dqbm+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (jc_zcjgb.dwbh='"+dwbh+"')";
	}
	String dwbh2=null;
	dwbh2=request.getParameter("dwbh2");
	if (dwbh2!=null)
	{
		dwbh2=cf.GB2Uni(dwbh2);
		if (!(dwbh2.equals("")))	wheresql+=" and  (jc_zcjgb.dwbh like '%"+dwbh2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_zcjgb.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_zcjgb.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_zcjgb.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_zcjgb.gys like '%"+gys2+"%')";
	}

	String zcxlbm=null;
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcxlbm='"+zcxlbm+"')";
	}


	String sfyh=null;
	sfyh=request.getParameter("sfyh");
	if (sfyh!=null)
	{
		if (!(sfyh.equals("")))	wheresql+=" and  (jc_zcjgb.sfyh='"+sfyh+"')";
	}

	String sfycx=null;
	sfycx=request.getParameter("sfycx");
	if (sfycx!=null)
	{
		if (!(sfycx.equals("")))	wheresql+=" and  (jc_zcjgb.sfycx='"+sfycx+"')";
	}
	String cxkssj=null;
	cxkssj=request.getParameter("cxkssj");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (jc_zcjgb.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	cxkssj=request.getParameter("cxkssj2");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (jc_zcjgb.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	String cxjzsj=null;
	cxjzsj=request.getParameter("cxjzsj");
	if (cxjzsj!=null)
	{
		if (!(cxjzsj.equals("")))	wheresql+="  and (jc_zcjgb.cxjzsj>=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
	}
	cxjzsj=request.getParameter("cxjzsj2");
	if (cxjzsj!=null)
	{
		if (!(cxjzsj.equals("")))	wheresql+="  and (jc_zcjgb.cxjzsj<=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
	}
	
	
	jc_zcjgb_zcbm=request.getParameter("jc_zcjgb_zcbm");
	if (jc_zcjgb_zcbm!=null)
	{
		jc_zcjgb_zcbm=cf.GB2Uni(jc_zcjgb_zcbm);
		if (!(jc_zcjgb_zcbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcbm='"+jc_zcjgb_zcbm+"')";
	}
	jc_zcjgb_zcmc=request.getParameter("jc_zcjgb_zcmc");
	if (jc_zcjgb_zcmc!=null)
	{
		jc_zcjgb_zcmc=cf.GB2Uni(jc_zcjgb_zcmc);
		if (!(jc_zcjgb_zcmc.equals("")))	wheresql+=" and  (jc_zcjgb.zcmc like '%"+jc_zcjgb_zcmc+"%')";
	}
	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcdlbm='"+zcdlbm+"')";
	}
	jc_zcjgb_gg=request.getParameter("jc_zcjgb_gg");
	if (jc_zcjgb_gg!=null)
	{
		jc_zcjgb_gg=cf.GB2Uni(jc_zcjgb_gg);
		if (!(jc_zcjgb_gg.equals("")))	wheresql+=" and  (jc_zcjgb.gg like '%"+jc_zcjgb_gg+"%')";
	}
	jc_zcjgb_lsj=request.getParameter("jc_zcjgb_lsj");
	if (jc_zcjgb_lsj!=null)
	{
		jc_zcjgb_lsj=jc_zcjgb_lsj.trim();
		if (!(jc_zcjgb_lsj.equals("")))	wheresql+=" and  (jc_zcjgb.lsj>="+jc_zcjgb_lsj+") ";
	}
	jc_zcjgb_lsj=request.getParameter("jc_zcjgb_lsj2");
	if (jc_zcjgb_lsj!=null)
	{
		jc_zcjgb_lsj=jc_zcjgb_lsj.trim();
		if (!(jc_zcjgb_lsj.equals("")))	wheresql+=" and  (jc_zcjgb.lsj<="+jc_zcjgb_lsj+") ";
	}
	jc_zcjgb_yhj=request.getParameter("jc_zcjgb_yhj");
	if (jc_zcjgb_yhj!=null)
	{
		jc_zcjgb_yhj=jc_zcjgb_yhj.trim();
		if (!(jc_zcjgb_yhj.equals("")))	wheresql+=" and  (jc_zcjgb.yhj>="+jc_zcjgb_yhj+") ";
	}
	jc_zcjgb_yhj=request.getParameter("jc_zcjgb_yhj2");
	if (jc_zcjgb_yhj!=null)
	{
		jc_zcjgb_yhj=jc_zcjgb_yhj.trim();
		if (!(jc_zcjgb_yhj.equals("")))	wheresql+=" and  (jc_zcjgb.yhj<="+jc_zcjgb_yhj+") ";
	}
	jc_zcjgb_zp=request.getParameter("jc_zcjgb_zp");
	if (jc_zcjgb_zp!=null)
	{
		jc_zcjgb_zp=cf.GB2Uni(jc_zcjgb_zp);
		if (!(jc_zcjgb_zp.equals("")))	wheresql+=" and  (jc_zcjgb.zp='"+jc_zcjgb_zp+"')";
	}
	zclbbm=request.getParameter("zclbbm");
	if (zclbbm!=null)
	{
		zclbbm=cf.GB2Uni(zclbbm);
		if (!(zclbbm.equals("")))	wheresql+=" and  (jc_zcjgb.zclbbm like '%"+zclbbm+"%')";
	}
	jc_zcjgb_zcysbm=request.getParameter("jc_zcjgb_zcysbm");
	if (jc_zcjgb_zcysbm!=null)
	{
		jc_zcjgb_zcysbm=cf.GB2Uni(jc_zcjgb_zcysbm);
		if (!(jc_zcjgb_zcysbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcysbm like '%"+jc_zcjgb_zcysbm+"%')";
	}
	jc_zcjgb_jldwbm=request.getParameter("jc_zcjgb_jldwbm");
	if (jc_zcjgb_jldwbm!=null)
	{
		jc_zcjgb_jldwbm=cf.GB2Uni(jc_zcjgb_jldwbm);
		if (!(jc_zcjgb_jldwbm.equals("")))	wheresql+=" and  (jc_zcjgb.jldwbm='"+jc_zcjgb_jldwbm+"')";
	}
	jc_zcjgb_sfbhpj=request.getParameter("jc_zcjgb_sfbhpj");
	if (jc_zcjgb_sfbhpj!=null)
	{
		jc_zcjgb_sfbhpj=cf.GB2Uni(jc_zcjgb_sfbhpj);
		if (!(jc_zcjgb_sfbhpj.equals("")))	wheresql+=" and  (jc_zcjgb.sfbhpj='"+jc_zcjgb_sfbhpj+"')";
	}
	jc_zcjgb_pjts=request.getParameter("jc_zcjgb_pjts");
	if (jc_zcjgb_pjts!=null)
	{
		jc_zcjgb_pjts=jc_zcjgb_pjts.trim();
		if (!(jc_zcjgb_pjts.equals("")))	wheresql+=" and (jc_zcjgb.pjts>="+jc_zcjgb_pjts+") ";
	}
	jc_zcjgb_pjts=request.getParameter("jc_zcjgb_pjts2");
	if (jc_zcjgb_pjts!=null)
	{
		jc_zcjgb_pjts=jc_zcjgb_pjts.trim();
		if (!(jc_zcjgb_pjts.equals("")))	wheresql+=" and (jc_zcjgb.pjts<="+jc_zcjgb_pjts+") ";
	}

	String jgpx=request.getParameter("jgpx");
	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT DECODE(jc_zcjgb.sftjcp,'Y','��','N','��'),DECODE(sfyh,'Y','�л�','N','<font color=\"#FF0000\">�޻�</font>'),DECODE(sfycx,'N','��','Y','<font color=\"#FF0000\">�д���</font>'),cxkssj,cxjzsj,dwbh,zclbbm,jc_zcjgb.xh,jc_zcjgb.zcbm,jc_zcjgb.zcmc,jc_zcjgb.gg,zcysbm,jldwbm,jc_zcjgb.lsj,jc_zcjgb.yhj,jc_zcjgb.cbj,jc_zcjgb.jsbl||'%',cxhdbl||'%',cxj,cxcbj,lscxhdbl||'%',DECODE(jc_zcjgb.sfbhpj,'Y','<font color=\"#FF0000\">��</font>','N','����'),jc_zcjgb.pjts,jc_zcjgb.cpjb,jc_zcjgb.fgsx,jc_zcjgb.cpsm,jc_zcjgb.cd,jc_zcjgb.zp,zcdlbm,zcxlbm,ppmc,gys,jc_zcjgb.lrr,jc_zcjgb.lrsj,jc_zcjgb.bz";
	ls_sql+=" FROM jc_zcjgb";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
	if (jgpx==null || jgpx.equals(""))
	{
		ls_sql+=" order by zcdlbm,zcxlbm,dwbh,zcbm";
	}
	else{
		ls_sql+=" order by "+jgpx;
	}
/*
 */
	pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Jc_zcjgbList.jsp","SelectJc_zcjgb.jsp","","EditJc_zcjgb.jsp");
	pageObj.setPageRow(Integer.parseInt(myxssl));//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zcbm","jc_zcjgb_zcmc","jdm_zcdlbm_zcdlmc","jc_zcjgb_xh","jc_zcjgb_gg","jc_zcjgb_lsj","jc_zcjgb_yhj","sq_dwxx_dwmc","jc_zcjgb_zp","jc_zcjgb_bz","jc_zcjgb_ppbm","zclbbm","jc_zcjgb_zcysbm","jc_zcjgb_jldwbm","jc_zcjgb_sfbhpj","jc_zcjgb_pjts","jc_zcjgb_pjjg"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zcbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"������ʼ","��������","�л�","�޻�","ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"StartCx.jsp","SaveEndCx.jsp","SaveIsSfyh.jsp","SaveNotSfyh.jsp","Jc_zcjgbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,1,1,1,0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] zcbm = request.getParameterValues("zcbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zcbm,"zcbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_zcjgb where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ı��۱�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
	pageObj.displayTopButton ();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">�Ƿ��Ƽ���Ʒ</td>
	<td  width="2%">�Ƿ��л�</td>
	<td  width="2%">�Ƿ��д���</td>
	<td  width="3%">������ʼʱ��</td>
	<td  width="3%">��������ʱ��</td>
	<td  width="4%">Ʒ�ƹ�Ӧ��</td>
	<td  width="4%">���ϵ��</td>
	<td  width="3%">�ͺ�</td>
	<td  width="2%">���ı���</td>
	<td  width="4%">��������</td>
	<td  width="3%">���</td>
	<td  width="2%">��ɫ</td>
	<td  width="2%">������λ</td>
	<td  width="2%">�г����</td>
	<td  width="2%">�����޼�</td>
	<td  width="2%">�����</td>
	<td  width="2%">�������</td>
	<td  width="2%">��������</td>
	<td  width="2%">������</td>
	<td  width="2%">���������</td>
	<td  width="2%">�����ڼ�������</td>
	<td  width="2%">�������</td>
	<td  width="2%">�������</td>
	<td  width="2%">��Ʒ����</td>
	<td  width="3%">�������</td>
	<td  width="4%">��Ʒ˵��</td>
	<td  width="2%">����</td>
	<td  width="3%">��Ƭ����</td>
	<td  width="4%">����</td>
	<td  width="4%">С��</td>
	<td  width="4%">Ʒ��</td>
	<td  width="4%">��Ӧ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="7%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printPageLinkTr();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>